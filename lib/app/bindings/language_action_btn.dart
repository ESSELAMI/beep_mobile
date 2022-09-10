import 'package:beep_mobile/app/controllers/language_action_btn.dart';
import 'package:get/get.dart';

class LanguageActionBtnBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LanguageActionBtnController(), permanent: true);
  }
}
