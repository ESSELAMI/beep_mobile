import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beep_mobile/base/controllers/app_translation.dart';

class AppTranslationController extends BaseAppTranslationController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  changeLanguage(String type) {
    Get.locale.toString() == 'en'
        ? Get.updateLocale((const Locale('ar')))
        : Get.updateLocale((const Locale('en')));
  }

  translate() {
    throw UnimplementedError();
  }
}
