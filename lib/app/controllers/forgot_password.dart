import 'dart:async';
import 'dart:convert';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:beep_mobile/app/controllers/app_translation.dart';

import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/services/local/locale_service.dart';

import 'package:beep_mobile/app/services/remote/auth.dart';
import 'package:beep_mobile/app/views/screens/auth/register/components/dialogs/terms_dialog.dart';
import 'package:beep_mobile/base/controllers/forgot_password.dart';
import 'package:beep_mobile/utils/snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ForgotPasswordController extends BaseForgotPasswordController {
  RxBool isSignupScreen = true.obs;
  RxBool isMale = true.obs;
  RxBool isRememberMe = false.obs;
  String shortPhoneNumber = "";
  late TextEditingController userNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController birthDateController;
  bool isVisible = false;
  String birthDate = "";

  int presume = 0;
  late RoundedLoadingButtonController registerButtonController;
  final Auth auth = Auth();
  final AppTranslationController appTranslationController =
      Get.put(AppTranslationController());
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    changePage();
    return true;
  }

  changePresume(int index) async {
    presume = index;
    change(presume, status: RxStatus.success());
  }

  changeLang(String lang) async {
    LocaleService().switchLocale(lang);
  }

  getLang() async {
    LocaleService().loadLocalFromBox();
  }

  changeBirthDate(DateTime? picked) {
    if (picked != null) {
      birthDateController.text =
          DateFormat("dd/MM/yyyy").format(DateTime.parse(picked.toString()));

      birthDate =
          DateFormat("ddMMyyyy").format(DateTime.parse(picked.toString()));
      change(birthDate, status: RxStatus.success());
    }
  }

  showTermsDialog() {
    isVisible = true;

    showDialog(
        barrierDismissible: true,
        context: Get.context!,
        builder: (BuildContext context) => const TermsDialog());
    change(isVisible, status: RxStatus.success());
  }

  verifyUser() async {
    if (userNameController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        birthDate.isEmpty ||
        presume.isNegative) {
      registerButtonController.reset();
      SnackBarWidget().showErrorSnackBar("empty fields");
      return;
    }
    final response = await auth
        .verifyUser(
            userNameController.text,
            firstNameController.text.toUpperCase(),
            lastNameController.text.toUpperCase(),
            birthDate,
            presume)
        .timeout(const Duration(seconds: 30), onTimeout: () {
      registerButtonController.reset();
      SnackBarWidget().showErrorSnackBar("timeoutexception");

      throw TimeoutException('The connection has timed out, Please try again!');
    });

    final Map<String, dynamic> responseData =
        json.decode(response.body.toString());

    if (response.statusCode == "200") {
      // AuthService.to.register();
      shortPhoneNumber = responseData["numtel"];
      change(shortPhoneNumber, status: RxStatus.success());
      goToCompletePhoneNumber();

      // var box = await Hive.openBox('token');
      // token.save();

    } else {
      registerButtonController.reset();
      SnackBarWidget().showErrorSnackBar(response.body.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    BackButtonInterceptor.add(myInterceptor);
    Get.rootDelegate.parameters.toString();
    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    birthDateController = TextEditingController();

    registerButtonController = RoundedLoadingButtonController();
    change(isSignupScreen, status: RxStatus.success());
  }

  registerPressed(String value) {
    if (value == "register" && isSignupScreen.isTrue) {
      isSignupScreen.value = false;
    } else if (value == "signup" && isSignupScreen.isFalse) {
      isSignupScreen.value = true;
    }
    change(isSignupScreen, status: RxStatus.success());
  }

  void changePage() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.LOGIN);
  }

  void goToCompletePhoneNumber() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate
        .offNamed(thenTo ?? Routes.COMPLETE_PHONE_NUMBER, parameters: {
      "numass": userNameController.text.toUpperCase(),
      "nom": lastNameController.text.toUpperCase(),
      "prenom": firstNameController.text.toUpperCase(),
      "d_naiss": birthDate,
      "presume": presume.toString(),
      "shortPhoneNumber": shortPhoneNumber.toString(),
    });
  }

  void goToLogin() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.offNamed(thenTo ?? Routes.LOGIN);
  }
}
