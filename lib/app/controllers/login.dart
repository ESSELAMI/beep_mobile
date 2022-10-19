import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:beep_mobile/app/controllers/app_translation.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/services/local/auth_service.dart';
import 'package:beep_mobile/app/services/local/locale_service.dart';
import 'package:beep_mobile/app/services/local/theme_service.dart';
import 'package:beep_mobile/app/services/remote/auth.dart';
import 'package:beep_mobile/base/controllers/login.dart';
import 'package:beep_mobile/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends BaseLoginController {
  RxBool isSignupScreen = true.obs;
  RxBool isMale = true.obs;
  RxBool isRememberMe = false.obs;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late RoundedLoadingButtonController loginButtonController;
  final Auth auth = Auth();
  final AppTranslationController appTranslationController =
      Get.put(AppTranslationController());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool showPass = false;
  changeVisibility() {
    showPass = !showPass;

    change(showPass, status: RxStatus.success());
  }

  void onStateChanged(bool isDarkModeEnabled) {
    ThemeService().switchTheme();
    change(null, status: RxStatus.success());
  }

  changeLang(String lang) async {
    LocaleService().switchLocale(lang);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    return true;
  }

  getLang() async {
    LocaleService().loadLocalFromBox();
  }

  @override
  login() async {
    if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
      loginButtonController.reset();
      SnackBarWidget().showErrorSnackBar("empty fields");
      return;
    }

    // final response = await auth
    //     .loginService(userNameController.text, passwordController.text)
    //     .timeout(const Duration(seconds: 30), onTimeout: () {
    //   loginButtonController.reset();
    //   SnackBarWidget().showErrorSnackBar("timeoutexception");

    //   throw TimeoutException('The connection has timed out, Please try again!');
    // });

    // final Map<String, dynamic> responseData =
    //     json.decode(response.body.toString());

    // if (response.statusCode == "200") {
    //   Token token = Token.fromJson(responseData);
    //   await TokenLocalService().saveUserToken(token);
    AuthService.to.login();
    // final thenTo = Get
    //     .rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    // Get.rootDelegate.history.removeLast();
    Get.rootDelegate.offNamed(Routes.HOME);
    Get.delete();
    // var box = await Hive.openBox('token');
    // token.save();

    // } else {
    loginButtonController.reset();
    // SnackBarWidget().showErrorSnackBar(response.body.toString());
    // }
  }

  @override
  void onInit() {
    super.onInit();
    BackButtonInterceptor.add(myInterceptor);
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    loginButtonController = RoundedLoadingButtonController();
    change(isSignupScreen, status: RxStatus.success());
  }

  loginPressed(String value) {
    if (value == "login" && isSignupScreen.isTrue) {
      isSignupScreen.value = false;
    } else if (value == "signup" && isSignupScreen.isFalse) {
      isSignupScreen.value = true;
    }
    change(isSignupScreen, status: RxStatus.success());
  }

  void goToRegister() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.REGISTER);
  }

  void goToForgotPassword() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.FORGOT_PASSWORD,
        parameters: {"test": "first"});
  }
}
