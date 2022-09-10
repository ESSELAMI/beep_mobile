import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:beep_mobile/app/controllers/app_translation.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/services/local/locale_service.dart';
import 'package:beep_mobile/app/services/remote/auth.dart';
import 'package:beep_mobile/base/controllers/register_success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterSuccessController extends BaseRegisterSuccessController {
  RxBool isSignupScreen = true.obs;
  RxBool isMale = true.obs;
  RxBool isRememberMe = false.obs;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late RoundedLoadingButtonController goHomeButtonController;
  final Auth auth = Auth();
  final AppTranslationController appTranslationController =
      Get.put(AppTranslationController());
  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   changePage();
  //   return true;
  // }
  changeLang(String lang) async {
    LocaleService().switchLocale(lang);
    // txt.text = "";
    // if (lang == 'ar') {
    //   //! test if token saved
    //   Token? json = await TokenLocalService().getUserToken();
    //   if (json != null) {
    //     txt.text = json.toString();
    //   } else {
    //   }
    // } else if (lang == 'fr') {
    //   //! test if user saved
    //   User? user = await UserLocalService().getUser();
    //   if (user != null) {
    //     txt.text = user.arFullName.toString();
    //   } else {
    //     List<Prescription>? prescriptions =
    //         await PrescriptionLocalService().getPrescriptions();

    //     await PrescriptionLocalService().savePrescriptions(prescriptions!);
    //   }
    // } else if (lang == 'en') {
    //   List<Prescription>? prescriptions =
    //       await PrescriptionLocalService().getPrescriptions();

    //   // await PrescriptionLocalService().savePrescriptions(prescriptions);
    // }
  }

  getLang() async {
    LocaleService().loadLocalFromBox();
  }

  @override
  void onInit() {
    BackButtonInterceptor.add(myInterceptor, name: "register_success");
    super.onInit();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    goHomeButtonController = RoundedLoadingButtonController();
    change(isSignupScreen, status: RxStatus.success());
  }

  void goToRegister() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.REGISTER);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    changePage();
    return true;
  }

  void changePage() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.LOGIN);
  }

  @override
  void onClose() {
    BackButtonInterceptor.removeByName("register_success");
    super.onClose();
  }
}
