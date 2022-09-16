import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/services/local/product.dart';
import 'package:beep_mobile/app/views/screens/home/add_product.dart';
import 'package:beep_mobile/app/views/screens/home/components/dialogs/confirm_close_app_dialog.dart';
import 'package:beep_mobile/app/views/screens/home/components/dialogs/product_dialog.dart';
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
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:beep_mobile/app/models/product/product.dart' as local_product;

class HomeController extends BaseHomeController
    with GetSingleTickerProviderStateMixin {
  List<local_product.Product> scannedProducts = [];
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

  bool isLoading = false;
  bool isVisible = false;
  late TextEditingController barcodeController;
  late TextEditingController nomFrController;
  late TextEditingController nomArController;
  late TextEditingController categoryController;
  late TextEditingController unityController;
  QRViewController? cameraController;
  AudioPlayer player = AudioPlayer();

  Barcode? result;

  bool flash = false;
  deleteProduct(int index) {
    scannedProducts.elementAt(index).delete();
    scannedProducts.removeAt(index);
    change(scannedProducts, status: RxStatus.success());
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
    ProductResult? result;
    isLoading = true;
    EasyLoading.show(
        indicator: CircularProgressIndicator(
      color: AppTheme.getThemeFromThemeMode().primaryColor,
    ));

    change(isLoading, status: RxStatus.success());
    ProductQueryConfiguration configuration = ProductQueryConfiguration(barcode,
        language: OpenFoodFactsLanguage.ARABIC, fields: [ProductField.ALL]);
    await OpenFoodAPIClient.getProduct(configuration).then((value) {
      result = value;
      barcodeController.text = result!.barcode.toString();

      nomFrController.text = result!.barcode.toString();

      isLoading = false;
      EasyLoading.dismiss();
      change(isLoading, status: RxStatus.success());
    });

    if (result!.status == 1) {
      return result!.product;
    }
    return null;
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
        if (value != null) {
          Navigator.push(
              Get.context!, SlideLeftRoute(ProductInfoWidget(value)));
        } else {
          showDialog(
              barrierDismissible: false,
              context: Get.context!,
              builder: (BuildContext context) => const ProductDialog(null));
        }
      });
    });
  }

  flashToggle() async {
    await cameraController!.toggleFlash();
    flash = !flash;
    change(flash, status: RxStatus.success());
  }

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

  changePage(String page) {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.toNamed(thenTo ?? page);
  }

  goToFamilyMembers() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.FAMILYMEMBERS);
  }

  goToPrescription() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.PRESCRIPTION);
  }

  goToScanner() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.SCANNER);
  }

  handleTabSelection(int index) {
    currentIndex = index;
    change(currentIndex, status: RxStatus.success());
  }

  @override
  void onInit() async {
    barcodeController = TextEditingController();
    nomFrController = TextEditingController();
    nomArController = TextEditingController();
    categoryController = TextEditingController();
    unityController = TextEditingController();
    configLoading();

    ProductLocalService().getProducts().then((value) {
      if (value != null) {
        scannedProducts.addAll(value);
        change(scannedProducts, status: RxStatus.success());
      }
    });
    change(scannedProducts, status: RxStatus.success());
    // tabController!.animation!.addListener(() {
    //   final aniValue = tabController!.animation!.value;
    //   if (aniValue - currentIndex > 0.5) {
    //     currentIndex = currentIndex + 1;
    //   } else if (aniValue - currentIndex < -0.5) {
    //     currentIndex = currentIndex - 1;
    //   }
    // });
    // isVisible = false;
    // NotificationService _notificationService = NotificationService();
    // user.localSave()
    isLoading = false;
    change(isLoading, status: RxStatus.success());
    // await CheckLocalLocalService().getChecks("user").then((value) async {
    //   if (value == true) {
    //     await UserService().getUserData().then((value) {
    //       if (value != null) {
    //         user = value;
    //         isLoading = false;
    //         change(isLoading, status: RxStatus.success());
    //         user.localSave();
    //         CheckLocalLocalService().saveCheckLocal("user");
    //         change(user, status: RxStatus.success());
    //       } else {
    //         isLoading = false;
    //         change(isLoading, status: RxStatus.success());
    //       }
    //     }).timeout(const Duration(seconds: 30), onTimeout: () {
    //       SnackBarWidget().showErrorSnackBar("timeoutexception");
    //       throw TimeoutException(
    //           'The connection has timed out, Please try again!');
    //     });
    //   } else {
    //     await UserLocalService().getUser().then((value) {
    //       if (value != null) {
    //         user = value;
    //         isLoading = false;
    //         change(isLoading, status: RxStatus.success());
    //         change(user, status: RxStatus.success());
    //       } else {
    //         isLoading = false;
    //         change(isLoading, status: RxStatus.success());
    //       }
    //     });
    //   }

    //   IO.Socket socket = IO.io(
    //       'http://130.61.51.10:3006',
    //       OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
    //           .setQuery({
    //         'userid': user.noAssure.toString(),
    //         'username':
    //             user.firstName.toString() + ' ' + user.lastName.toString(),
    //         'type': 'mobile',
    //       }) // optional
    //           .build());
    //   socket.onConnect((_) {
    //     print('connect');
    //     // socket.emit('new user', 'test');
    //   });
    //   socket.on('notificationDialog', (data) {
    //     //notification
    //     _notificationService.showNotifications();
    //   });
    //   socket.on('customMessage', (data) {
    //     //notification
    //     _notificationService.showCustomNotifications(data);
    //   });
    //   socket.on(
    //       'new message', (data) => print("new message : " + data.toString()));
    //   socket.connect();

    //   socket.onDisconnect((_) => print('disconnect'));
    // });

    BackButtonInterceptor.add(myInterceptor, name: "home");
    super.onInit();
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

  @override
  void onClose() {
    BackButtonInterceptor.removeByName("home");
    isVisible = false;
    change(isVisible, status: RxStatus.empty());
    super.onClose();
  }
}
