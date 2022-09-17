import 'package:beep_mobile/app/controllers/home.dart';
import 'package:beep_mobile/app/views/screens/scanner/components/product_dialog.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerWidget extends GetView<HomeController> {
  ScannerWidget({Key? key}) : super(key: key);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

// Create a key
  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.

    return controller.obx(
      (state) => Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(
              controller.flash ? Icons.flash_on : Icons.flash_off,
              size: 28,
              // color: AppTheme.getThemeFromThemeMode().primaryColor,
            ),
            onPressed: () async {
              controller.flashToggle();
            },
          ),
          appBar: AppBar(
            title: Text(LocaleKeys.label_scan_barcode.tr,
                style: AppTheme.getTextStyle(
                    AppTheme.getThemeFromThemeMode().textTheme.titleLarge,
                    fontWeight: 700)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  controller.searchBarcodeController.clear();
                  showDialog(
                      barrierDismissible: true,
                      context: Get.context!,
                      builder: (BuildContext context) =>
                          const ProductDialog(null));
                },
                child: Text(LocaleKeys.label_manual.tr,
                    style: AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.titleLarge,
                        fontWeight: 700)),
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: controller.onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderRadius: 16,
                    borderLength: 30,
                    borderWidth: 5,
                  ),
                  onPermissionSet: (ctrl, p) =>
                      controller.onPermissionSet(context, ctrl, p),
                ),
              ),
            ],
          )),
    );
  }
}
