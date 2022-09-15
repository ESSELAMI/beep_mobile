import 'package:beep_mobile/app/controllers/home.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
            leading: IconButton(
              onPressed: () => controller.changePage(Routes.HOME),
              icon: Icon(
                Get.locale.toString() == 'ar'
                    ? MdiIcons.chevronRight
                    : MdiIcons.chevronLeft,
                size: 26,
              ),
            ),
            title: Text("Scan Barcode",
                style: AppTheme.getTextStyle(
                    AppTheme.getThemeFromThemeMode().textTheme.titleLarge,
                    fontWeight: 700)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // handle the press
                },
                child: Text('Manual',
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
