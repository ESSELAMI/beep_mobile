import 'dart:async';
import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:beep_mobile/app/controllers/app_translation.dart';
import 'package:beep_mobile/app/models/center/center.dart';
import 'package:beep_mobile/app/models/token/token.dart';
import 'package:beep_mobile/app/models/user/user.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/views/screens/profile/user_info/dialogs/confirm_dialog.dart';

import 'package:http/http.dart' as http;
import 'package:beep_mobile/app/services/local/locale_service.dart';
import 'package:beep_mobile/app/services/local/user.dart';
import 'package:beep_mobile/app/services/remote/auth.dart';
import 'package:beep_mobile/app/services/remote/token.dart';
import 'package:beep_mobile/app/services/remote/user.dart';
import 'package:beep_mobile/base/controllers/profile.dart';
import 'package:beep_mobile/utils/api/urls.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/snack_bar.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfileController extends BaseProfileController
    with GetSingleTickerProviderStateMixin {
  RxBool isSignupScreen = true.obs;
  RxBool isMale = true.obs;
  RxBool isRememberMe = false.obs;
  TabController? tabController;
  int currentIndex = 0;
  User user = User();
  bool isVisible = false;
  late String keyApp;
  int expiresIn = 0;
  String smsCode = "";
  late RoundedLoadingButtonController changePhoneButtonController;
  late RoundedLoadingButtonController changePasswordButtonController;
  late RoundedLoadingButtonController sendButtonController;
  late RoundedLoadingButtonController resendButtonController;
  late RoundedLoadingButtonController editInfoButtonController;

  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController newPhoneNumberController;
  late TextEditingController confirmPhoneNumberController;
  late TextEditingController firstNameArController;
  late TextEditingController emailController;
  late TextEditingController lastNameArController;
  bool isLoading = false;
  bool showOTP = false;
  final Auth auth = Auth();
  final AppTranslationController appTranslationController =
      Get.put(AppTranslationController());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool showOldPass = false, showNewPass = false, showConfirmPass = false;

  Centre userCenter = Centre();
  @override
  void onInit() {
    configLoading();
    BackButtonInterceptor.add(myInterceptor, name: "profile");
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameArController = TextEditingController();
    lastNameArController = TextEditingController();
    newPhoneNumberController = TextEditingController();
    confirmPhoneNumberController = TextEditingController();
    emailController = TextEditingController();
    changePhoneButtonController = RoundedLoadingButtonController();
    changePasswordButtonController = RoundedLoadingButtonController();
    sendButtonController = RoundedLoadingButtonController();
    resendButtonController = RoundedLoadingButtonController();
    editInfoButtonController = RoundedLoadingButtonController();
    tabController = TabController(length: 3, vsync: this);
    isLoading = true;
    change(isLoading, status: RxStatus.success());
    UserLocalService().getUser().then((value) {
      user = value!;
      userCenter = user.centre!;
      firstNameArController.text = user.firstNameAr!;
      lastNameArController.text = user.lastNameAr!;
      emailController.text = user.email!;
      isLoading = false;
      change(isLoading, status: RxStatus.success());
      // CentreLocalService().getCentres().then((value) {
      //   if (value != null) {
      //     print("profile from local");
      //     value.asMap().forEach((index, center) {
      //       if (center.code != null) {
      //         if (center.code == user.center) {
      //           userCenter = center;
      //         }
      //       }
      //     });
      //     isLoading = false;
      //     change(isLoading, status: RxStatus.success());
      //   } else {
      //     CentreService().getCentres().then((centers) {
      //       if (centers != null) {
      //         print("profile from remote");

      //         centers.asMap().forEach((index, center) {
      //           // center.localSave();
      //           center.lastCheck = DateTime.now();
      //           if (center.code != null) {
      //             if (center.code == user.center) {
      //               userCenter = center;
      //             }
      //           }
      //         });
      //         CentreLocalService().saveCentres(centers);
      //         isLoading = false;
      //         change(isLoading, status: RxStatus.success());
      //       } else {
      //         isLoading = false;
      //         change(isLoading, status: RxStatus.empty());
      //       }
      //     });
      //   }
      // });
    });

    change(user, status: RxStatus.success());

    super.onInit();

    change(isSignupScreen, status: RxStatus.success());
  }

  void configLoading() {
    EasyLoading.instance
      // ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.red
      ..backgroundColor = Colors.blueAccent
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.grey.withOpacity(0.6)
      ..userInteractions = false
      ..loadingStyle = EasyLoadingStyle.custom
      ..dismissOnTap = false;
  }

  savePDF() async {
    EasyLoading.show(
      status: LocaleKeys.label_loading.tr + "...",
      maskType: EasyLoadingMaskType.custom,
    );

    Token? token = await TokenService().getToken();
    try {
      final response = await http.get(
        Uri.parse("DataApi.getAffiliationDocument"),
        headers: {
          "content-type": "application/json",
          "accept": "*/*",
          'Authorization': "Bearer " + token!.accessToken!,
        },
      ).timeout(const Duration(seconds: 30), onTimeout: () {
        SnackBarWidget().showErrorSnackBar("timeoutexception");
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      if (response.statusCode.toString() == "200") {
        DateFormat ft = DateFormat("yyyyMMddHHmmssSS");
        final affiliationName = "affiliation" + ft.format(DateTime.now());
        var bytes = response.bodyBytes;
        // final dir = await getTemporaryDirectory();
        String dir = (await getApplicationDocumentsDirectory()).path;
        File file = File('$dir/$affiliationName.pdf');
        await file.writeAsBytes(bytes);
        final url = file.path;

        await OpenFile.open(url).then((value) {
          EasyLoading.dismiss();
        }).catchError((error) {
          EasyLoading.dismiss();
        });
      } else {
        print(response.body);
        SnackBarWidget().showErrorSnackBar(response.body);

        EasyLoading.dismiss();
      }
      EasyLoading.dismiss();
      return null;
    } catch (error) {
      EasyLoading.dismiss();
      rethrow;
    }

    // controller.generateInvoice();
    // sickLeaveReceipt =
    //     Uri.parse(DataApi.getSickLeaveReciept + "22125010206244").toString();
    // print(sickLeaveReceipt);

    // sickLeaveReceiptFile = file;
    // change(sickLeaveReceiptFile, status: RxStatus.success());
    // Navigator.push(
    //     Get.context!, SlideLeftRoute(const SickLeaveReceiptWidget()));
  }

  changeLang(String lang) async {
    LocaleService().switchLocale(lang);
  }

  showTermsDialog() {
    firstNameArController.text = user.firstNameAr!;
    lastNameArController.text = user.lastNameAr!;
    emailController.text = user.email!;
    isVisible = true;

    showDialog(
        barrierDismissible: true,
        context: Get.context!,
        builder: (BuildContext context) => const ConfirmDialog());
    change(isVisible, status: RxStatus.success());
  }

  changeVisibility(int index) {
    if (index == 0) {
      showOldPass = !showOldPass;
    } else if (index == 1) {
      showNewPass = !showNewPass;
    } else if (index == 2) {
      showConfirmPass = !showConfirmPass;
    }
    change(showOldPass, status: RxStatus.success());
  }

  void _listenOTP() async {
    SmsAutoFill().listenForCode;
  }

  setSMSCode(String code) {
    smsCode = code;
    // change(smsCode, status: RxStatus.success());
  }

  sendOTP() {
    if (newPhoneNumberController.text.isNotEmpty &&
        newPhoneNumberController.text == confirmPhoneNumberController.text) {
      SmsAutoFill().getAppSignature.then((signature) {
        keyApp = signature;
        UserService()
            .sendNewPhoneNumber(newPhoneNumberController.text, keyApp)
            .then((value) {
          if (value != -1) {
            expiresIn = value!;
            showOTP = true;
            _listenOTP();

            if (changePhoneButtonController.currentState != ButtonState.idle) {
              changePhoneButtonController.reset();
            }
            change(showOTP, status: RxStatus.success());
          } else {
            SnackBarWidget().showErrorSnackBar("error phone number");
            changePhoneButtonController.reset();
          }
        });
      });
    } else {
      Get.snackbar(
        LocaleKeys.error_title.tr,
        LocaleKeys.error_empty_fields.tr,
        snackStyle: SnackStyle.FLOATING,
        animationDuration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(16),
        // padding: const EdgeInsets.all(16),
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );

      changePhoneButtonController.reset();
    }
  }

  resendOTP() {
    smsCode = "";
    change(smsCode, status: RxStatus.success());
    if (newPhoneNumberController.text.isNotEmpty &&
        newPhoneNumberController.text == confirmPhoneNumberController.text) {
      SmsAutoFill().getAppSignature.then((signature) {
        keyApp = signature;
        UserService()
            .sendNewPhoneNumber(newPhoneNumberController.text, keyApp)
            .then((value) {
          if (value != -1) {
            expiresIn = value!;
            showOTP = true;
            change(showOTP, status: RxStatus.success());
            _listenOTP();
            resendButtonController.reset();
          }
        });
      });
    } else {
      // changeButtonController.error();
      resendButtonController.reset();
    }
  }

  confirmOTP() {
    if (smsCode.isNotEmpty) {
      UserService().confirmOTPPhoneNumber(smsCode).then((value) {
        if (value!.statusCode.toString() == "200") {
          UserLocalService().updateUserPhone(newPhoneNumberController.text);
          Get.snackbar(
            LocaleKeys.label_success_title.tr,
            LocaleKeys.label_phone_changed_successfully.tr,
            animationDuration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.greenAccent,
            icon: const Icon(Icons.done, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
          );
          sendButtonController.reset();
          showOTP = false;
          confirmPhoneNumberController.text = "";
          newPhoneNumberController.text = "";
          change(showOTP, status: RxStatus.success());
          // UserLocalService()
          //     .updateUserPhone(newPhoneNumberController.text)
          //     .then((value) => null);
        } else {
          SnackBarWidget().showErrorSnackBar("ERREUR CODE SMS");
          sendButtonController.reset();
        }
      });
    } else {
      SnackBarWidget().showErrorSnackBar("empty fields");
      sendButtonController.reset();
    }
  }

  setTimer() {
    expiresIn = 0;
    change(expiresIn, status: RxStatus.success());
  }

  getLang() async {
    LocaleService().loadLocalFromBox();
  }

  updatePassword() async {
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        LocaleKeys.error_title.tr,
        LocaleKeys.error_passwords_not_match.tr,
        animationDuration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading = false;
      change(isLoading, status: RxStatus.success());
      changePasswordButtonController.reset();
      return;
    }
    if (oldPasswordController.text.isNotEmpty &&
        newPasswordController.text.isNotEmpty) {
      isLoading = true;

      change(isLoading, status: RxStatus.success());
      await UserService()
          .updatePassword(
              oldPasswordController.text, newPasswordController.text)
          .then((value) {
        isLoading = false;
        change(isLoading, status: RxStatus.success());
        if (value!.statusCode.toString() == "200") {
          Get.snackbar(
            LocaleKeys.label_success_title.tr,
            LocaleKeys.label_password_change_success.tr,
            animationDuration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.all(16),
            colorText: AppTheme.getThemeFromThemeMode().colorScheme.background,
            padding: const EdgeInsets.all(16),
            backgroundColor:
                AppTheme.getThemeFromThemeMode().colorScheme.secondaryVariant,
            icon: Icon(Icons.done,
                color: AppTheme.getThemeFromThemeMode().colorScheme.background),
            snackPosition: SnackPosition.BOTTOM,
          );
          oldPasswordController.text = "";
          newPasswordController.text = "";
          confirmPasswordController.text = "";
          changePasswordButtonController.reset();
        } else {
          Get.snackbar(
            LocaleKeys.error_title.tr,
            LocaleKeys.error_incorrect_password.tr,
            animationDuration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.redAccent,
            icon: const Icon(Icons.error, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
          );
          changePasswordButtonController.reset();
        }
      }).timeout(const Duration(seconds: 30), onTimeout: () {
        SnackBarWidget().showErrorSnackBar("timeoutexception");
        changePasswordButtonController.reset();
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
    } else {
      Get.snackbar(
        LocaleKeys.error_title.tr,
        LocaleKeys.error_empty_fields.tr,
        animationDuration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
      changePasswordButtonController.reset();
    }
  }

  updateInfo() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (firstNameArController.text == user.firstNameAr &&
        lastNameArController.text == user.lastNameAr &&
        emailController.text == user.email) {
      Get.snackbar(
        LocaleKeys.error_title.tr,
        LocaleKeys.error_same_info.tr,
        animationDuration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading = false;
      change(isLoading, status: RxStatus.success());
      editInfoButtonController.reset();
      return;
    }
    if (firstNameArController.text.isNotEmpty &&
        lastNameArController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      isLoading = true;

      change(isLoading, status: RxStatus.success());
      await UserService()
          .updateInfo(firstNameArController.text, lastNameArController.text,
              emailController.text)
          .then((value) {
        isLoading = false;
        change(isLoading, status: RxStatus.success());
        if (value!.statusCode.toString() == "200") {
          UserLocalService().updateUserInfo(emailController.text,
              firstNameArController.text, lastNameArController.text);
          Get.snackbar(
            LocaleKeys.label_success_title.tr,
            LocaleKeys.label_change_with_success.tr,
            animationDuration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.all(16),
            colorText: AppTheme.getThemeFromThemeMode().colorScheme.background,
            padding: const EdgeInsets.all(16),
            backgroundColor:
                AppTheme.getThemeFromThemeMode().colorScheme.secondaryVariant,
            icon: Icon(Icons.done,
                color: AppTheme.getThemeFromThemeMode().colorScheme.background),
            snackPosition: SnackPosition.BOTTOM,
          );
          Navigator.of(Get.context!).pop();
          editInfoButtonController.reset();
        } else {
          Get.snackbar(
            LocaleKeys.error_title.tr,
            LocaleKeys.error_contact_cnas.tr,
            animationDuration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.redAccent,
            icon: const Icon(Icons.error, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
          );
          editInfoButtonController.reset();
        }
      }).timeout(const Duration(seconds: 30), onTimeout: () {
        SnackBarWidget().showErrorSnackBar("timeoutexception");
        editInfoButtonController.reset();
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
    } else {
      Get.snackbar(
        LocaleKeys.error_title.tr,
        LocaleKeys.error_empty_fields.tr,
        animationDuration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
      editInfoButtonController.reset();
    }
  }

  void changePage() {
    // final thenTo =
    //     Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    // Get.rootDelegate.toNamed(thenTo ?? Routes.HOME);

    // final thenTo =
    //     Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.history.removeLast();

    Get.rootDelegate.offNamed(Get.rootDelegate
        .history[Get.rootDelegate.history.length - 1].currentPage!.name
        .toString());
  }

  changeIndex(int index) {
    currentIndex = index;
    change(currentIndex, status: RxStatus.success());
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    changePage();
    return true;
  }

  bool isNumeric(String s) {
    if (s.isEmpty || s == "null") {
      return false;
    }
    return double.tryParse(s) != null;
  }

  goToMAp() {
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.toNamed(thenTo ?? Routes.MAP);

    // change(selectedPage, status: RxStatus.success());
  }

  @override
  void onClose() {
    BackButtonInterceptor.removeByName("profile");
    super.onClose();
  }
}
