import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/services/local/auth_service.dart';
import 'package:beep_mobile/base/controllers/home.dart';

class RootController extends BaseHomeController {
  late String initPage = Routes.Splash;
  @override
  void onInit() async {
    super.onInit();

    if (AuthService.to.isFirstValue) {
      initPage = Routes.OnBoarding;
    } else {
      if (AuthService.to.isLoggedInValue) {
        initPage = Routes.HOME;
      } else {
        initPage = Routes.LOGIN;
      }
    }
    change(initPage, status: RxStatus.success());
    // FlutterNativeSplash.remove();
  }

  @override
  void onClose() {}
}
