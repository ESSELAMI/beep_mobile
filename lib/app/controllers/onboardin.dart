import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:beep_mobile/app/services/local/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/base/controllers/onboarding.dart';

class OnBoardingController extends BaseOnBoardingController {
  Widget buildImage(String assetName, [double width = 170]) {
    return ClipOval(
        child: Image.asset(
      'assets/images/$assetName',
      width: width,
      height: width,
    ));
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    return true;
  }

  void onStateChanged(bool isDarkModeEnabled) {
    ThemeService().switchTheme();
    change(null, status: RxStatus.success());
  }

  @override
  void onInit() {
    super.onInit();
    BackButtonInterceptor.add(myInterceptor);
  }

  void onIntroEnd() async {
    // final thenTo =
    //     Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    // Get.rootDelegate.history.removeLast();

    // Get.rootDelegate.toNamed(Routes.LOGIN);
    Get.rootDelegate.offAndToNamed(Routes.LOGIN,
        popMode: Get.rootDelegate.backButtonPopMode);
  }
}
