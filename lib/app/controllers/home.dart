import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:beep_mobile/app/models/product/product.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/services/local/product.dart';
import 'package:beep_mobile/app/services/remote/product.dart';
import 'package:beep_mobile/app/views/screens/home/add_product.dart';
import 'package:beep_mobile/app/views/screens/home/components/dialogs/confirm_close_app_dialog.dart';
import 'package:beep_mobile/app/views/screens/home/history_widget.dart';
import 'package:beep_mobile/app/views/screens/scanner/scanner_widget.dart';
import 'package:beep_mobile/app/views/widgets/route_builders/slide_left_route.dart';
import 'package:beep_mobile/base/controllers/home.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:beep_mobile/utils/api/notificationsApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:beep_mobile/app/models/product/product.dart' as local_product;

class HomeController extends BaseHomeController
    with GetSingleTickerProviderStateMixin {
  Product scannedProduct = Product();
  List<local_product.Product> scannedProducts = [];
  bool isLoading = false;
  bool isVisible = false;
  late TextEditingController barcodeController;
  late TextEditingController searchBarcodeController;
  late TextEditingController nomFrController;
  late TextEditingController nomArController;
  late TextEditingController categoryController;
  late TextEditingController unityController;
  QRViewController? cameraController;
  AudioPlayer player = AudioPlayer();
  Barcode? result;
  bool flash = false;
  int selectedIndex = 2;

  final Container barcodesPage = Container(
    color: Colors.redAccent,
  );
  final HistoryWidget historyPage = const HistoryWidget();
  final ScannerWidget scannerPage = ScannerWidget();
  final Container helpPage = Container(color: Colors.orangeAccent);
  final Container settingsPage = Container(color: Colors.purpleAccent);

  dynamic pages() => <dynamic>[
        barcodesPage,
        historyPage,
        scannerPage,
        helpPage,
        settingsPage,
      ];

  TabController? tabController;
  int currentIndex = 2;
  @override
  void onInit() async {
    barcodeController = TextEditingController();
    nomFrController = TextEditingController();
    nomArController = TextEditingController();
    categoryController = TextEditingController();
    unityController = TextEditingController();
    searchBarcodeController = TextEditingController();
    configLoading();

    isLoading = false;
    change(isLoading, status: RxStatus.success());
    BackButtonInterceptor.add(myInterceptor, name: "home");
    super.onInit();
  }

  deleteProduct(int index) {
    scannedProducts.elementAt(index).delete();
    scannedProducts.removeAt(index);
    change(scannedProducts, status: RxStatus.success());
  }

  addProduct() async {
    print(
        '${barcodeController.text}\n${nomFrController.text}\n${nomArController.text}');
    local_product.Product product = local_product.Product();
    product.codeBarre = barcodeController.text;
    product.nomAr = nomArController.text;
    product.nomFr = nomFrController.text;

    ProductLocalService().saveProduct(product).then((value) {
      if (value) {
        scannedProducts.add(product);
        showSnackBar(
            LocaleKeys.label_success_title.tr, 'Product added successfully');
      } else {
        showSnackBar(
            LocaleKeys.label_success_title.tr, 'Product already exist');
      }
    });

    change(scannedProducts, status: RxStatus.success());

    await cameraController!.resumeCamera();
    Navigator.pop(Get.context!);
  }

  Future<Product?>? getProduct(String barcode) async {
    Product? result;
    isLoading = true;
    EasyLoading.show(
        indicator: CircularProgressIndicator(
      color: AppTheme.getThemeFromThemeMode().primaryColor,
    ));

    change(isLoading, status: RxStatus.success());

    await ProductService().getProduct(barcode).then((value) {
      if (value != null) {
        scannedProduct = value;
        barcodeController.text = scannedProduct.codeBarre.toString();
        nomFrController.text = scannedProduct.nomFr.toString();
      } else {
        barcodeController.text = "Aucun produit trouvé";
        nomFrController.text = "Acun produit trouvé";
      }
      isLoading = false;
      EasyLoading.dismiss();
      change(isLoading, status: RxStatus.success());
      Navigator.push(Get.context!, SlideLeftRoute(const ProductInfoWidget()));
    });

    return result;
    // return null;
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  onQRViewCreated(QRViewController ctrl) async {
    // player.setSource(AssetSource('audios/beep.mp3'));
    cameraController = ctrl;
    cameraController!.resumeCamera();

    cameraController!.scannedDataStream.listen((scanData) async {
      player.play(AssetSource('audios/beep.mp3'));
      //  player.play();
      result = scanData;
      change(result, status: RxStatus.success());
      print("==============================>$result");
      cameraController!.pauseCamera();
      // await cameraController!.resumeCamera();
      getProduct(result!.code.toString())!.then((value) {
        // if (value != null) {
        // Navigator.push(Get.context!, SlideLeftRoute(ProductInfoWidget(value!)));
        // }
      });
    });
  }

  flashToggle() async {
    await cameraController!.toggleFlash();
    flash = !flash;
    change(flash, status: RxStatus.success());
  }

  goToScanner() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.SCANNER);
  }

  handleTabSelection(int index) {
    currentIndex = index;
    change(currentIndex, status: RxStatus.success());
    if (index == 1) {
      ProductLocalService().getProducts().then((value) {
        if (value != null) {
          scannedProducts.addAll(value);
          change(scannedProducts, status: RxStatus.success());
        }
      });
    }
  }

  showConfirmDialog() {
    isVisible = true;

    showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) => const CloseAppDialog());
    change(isVisible, status: RxStatus.success());
  }

  closeApp() {
    isVisible = false;
    change(isVisible, status: RxStatus.success());
    SystemNavigator.pop();
  }

  cancel() {
    isVisible = false;
    change(isVisible, status: RxStatus.success());
  }

  changePage(String page) {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.toNamed(thenTo ?? page);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    if (isVisible == false) {
      showConfirmDialog();
      return true;
    } else {
      Navigator.of(Get.context!).pop();
      isVisible = false;
      change(isVisible, status: RxStatus.success());
      return true;
    }
  }

  showSnackBar(String type, String message) {
    Get.snackbar(
      type == LocaleKeys.error_title.tr
          ? LocaleKeys.error_title.tr
          : LocaleKeys.label_success_title.tr,
      message,
      animationDuration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      backgroundColor: type == LocaleKeys.error_title.tr
          ? Colors.redAccent
          : Colors.greenAccent,
      icon: Icon(type == LocaleKeys.error_title.tr ? Icons.error : Icons.done,
          color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  @override
  void onClose() {
    BackButtonInterceptor.removeByName("home");
    isVisible = false;
    change(isVisible, status: RxStatus.empty());
    super.onClose();
  }
}
