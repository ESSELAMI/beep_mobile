import 'package:beep_mobile/app/controllers/language_action_btn.dart';
import 'package:beep_mobile/app/controllers/login.dart';
import 'package:beep_mobile/app/controllers/theme.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.put(LanguageActionBtnController(), permanent: true);
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
