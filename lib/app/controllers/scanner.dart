// import 'dart:developer';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:back_button_interceptor/back_button_interceptor.dart';
// import 'package:beep_mobile/app/models/user/user.dart';
// import 'package:beep_mobile/app/routes/app_pages.dart';
// import 'package:beep_mobile/app/views/screens/home/add_product.dart';
// import 'package:beep_mobile/app/views/screens/home/components/dialogs/confirm_close_app_dialog.dart';
// import 'package:beep_mobile/app/views/screens/home/components/dialogs/product_dialog.dart';
// import 'package:beep_mobile/app/views/widgets/route_builders/slide_left_route.dart';
// import 'package:beep_mobile/base/controllers/scanner.dart';
// // import 'package:beep_mobile/utils/api/notificationsApi.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class ScannerController extends BaseScannerController {
//   bool isLoading = false;
//   bool isVisible = false;
//   QRViewController? cameraController;
//   AudioPlayer player = AudioPlayer();

//   Barcode? result;

//   bool flash = false;
//   late User user = User();


//   void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

//   onQRViewCreated(QRViewController ctrl) async {
//     // player.setSource(AssetSource('audios/beep.mp3'));
//     cameraController = ctrl;
//     cameraController!.resumeCamera();

//     cameraController!.scannedDataStream.listen((scanData) async {
//       player.play(AssetSource('audios/beep.mp3'));
//       //  player.play();
//       result = scanData;
//       change(result, status: RxStatus.success());
//       print("==============================>$result");
//       cameraController!.pauseCamera();
//       // await cameraController!.resumeCamera();
//       getProduct(result!.code.toString())!.then((value) {
//         if (value != null) {
//           Navigator.push(
//               Get.context!, SlideLeftRoute(ProductInfoWidget(value)));
//         } else {
//           showDialog(
//               barrierDismissible: false,
//               context: Get.context!,
//               builder: (BuildContext context) => const ProductDialog(null));
//         }
//       });
//     });
//   }

//   flashToggle() async {
//     await cameraController!.toggleFlash();
//     flash = !flash;
//     change(flash, status: RxStatus.success());
//   }

//   changePage(String page) {
//     final thenTo =
//         Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
//     Get.rootDelegate.toNamed(thenTo ?? page);
//   }

//   goToFamilyMembers() {
//     final thenTo =
//         Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
//     Get.rootDelegate.offNamed(thenTo ?? Routes.FAMILYMEMBERS);
//   }

//   goToPrescription() {
//     final thenTo =
//         Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
//     Get.rootDelegate.offNamed(thenTo ?? Routes.PRESCRIPTION);
//   }

//   @override
//   void onInit() async {
//     // cameraController = QRViewController();

//     // isVisible = false;
//     // NotificationService _notificationService = NotificationService();
//     // user.localSave()
//     isLoading = false;
//     change(isLoading, status: RxStatus.success());
//     // await CheckLocalLocalService().getChecks("user").then((value) async {
//     //   if (value == true) {
//     //     await UserService().getUserData().then((value) {
//     //       if (value != null) {
//     //         user = value;
//     //         isLoading = false;
//     //         change(isLoading, status: RxStatus.success());
//     //         user.localSave();
//     //         CheckLocalLocalService().saveCheckLocal("user");
//     //         change(user, status: RxStatus.success());
//     //       } else {
//     //         isLoading = false;
//     //         change(isLoading, status: RxStatus.success());
//     //       }
//     //     }).timeout(const Duration(seconds: 30), onTimeout: () {
//     //       SnackBarWidget().showErrorSnackBar("timeoutexception");
//     //       throw TimeoutException(
//     //           'The connection has timed out, Please try again!');
//     //     });
//     //   } else {
//     //     await UserLocalService().getUser().then((value) {
//     //       if (value != null) {
//     //         user = value;
//     //         isLoading = false;
//     //         change(isLoading, status: RxStatus.success());
//     //         change(user, status: RxStatus.success());
//     //       } else {
//     //         isLoading = false;
//     //         change(isLoading, status: RxStatus.success());
//     //       }
//     //     });
//     //   }

//     //   IO.Socket socket = IO.io(
//     //       'http://130.61.51.10:3006',
//     //       OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
//     //           .setQuery({
//     //         'userid': user.noAssure.toString(),
//     //         'username':
//     //             user.firstName.toString() + ' ' + user.lastName.toString(),
//     //         'type': 'mobile',
//     //       }) // optional
//     //           .build());
//     //   socket.onConnect((_) {
//     //     print('connect');
//     //     // socket.emit('new user', 'test');
//     //   });
//     //   socket.on('notificationDialog', (data) {
//     //     //notification
//     //     _notificationService.showNotifications();
//     //   });
//     //   socket.on('customMessage', (data) {
//     //     //notification
//     //     _notificationService.showCustomNotifications(data);
//     //   });
//     //   socket.on(
//     //       'new message', (data) => print("new message : " + data.toString()));
//     //   socket.connect();

//     //   socket.onDisconnect((_) => print('disconnect'));
//     // });

//     BackButtonInterceptor.add(myInterceptor, name: "scanner");
//     super.onInit();
//   }

//   showConfirmDialog() {
//     isVisible = true;

//     showDialog(
//         barrierDismissible: false,
//         context: Get.context!,
//         builder: (BuildContext context) => const CloseAppDialog());
//     change(isVisible, status: RxStatus.success());
//   }

//   closeApp() {
//     isVisible = false;
//     change(isVisible, status: RxStatus.success());
//     SystemNavigator.pop();
//   }

//   cancel() {
//     isVisible = false;
//     change(isVisible, status: RxStatus.success());
//   }

//   bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
//     Get.rootDelegate.history.removeLast();

//     Get.rootDelegate.offNamed(Get.rootDelegate
//         .history[Get.rootDelegate.history.length - 1].currentPage!.name
//         .toString());
//     return true;
//   }

//   @override
//   void onClose() {
//     BackButtonInterceptor.removeByName("scanner");
//     isVisible = false;
//     change(isVisible, status: RxStatus.empty());
//     super.onClose();
//   }

//   @override
//   void dispose() {
//     cameraController?.dispose();
//     super.dispose();
//   }
// }
