import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:beep_mobile/app/models/user/user.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/views/screens/home/components/dialogs/confirm_close_app_dialog.dart';
import 'package:beep_mobile/base/controllers/home.dart';
// import 'package:beep_mobile/utils/api/notificationsApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends BaseHomeController
    with GetSingleTickerProviderStateMixin {
  bool isLoading = false;
  bool isVisible = false;
  TabController? tabController;
  int currentIndex = 0;
  bool flash = false;
  late User user = User();

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

  handleTabSelection() {
    currentIndex = tabController!.index;
    change(currentIndex, status: RxStatus.success());
  }

  @override
  void onInit() async {
    tabController = TabController(
        length: 4,
        vsync: this,
        animationDuration: const Duration(milliseconds: 1));
    tabController!.addListener(handleTabSelection);
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
