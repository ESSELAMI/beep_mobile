import 'package:beep_mobile/app/controllers/language_action_btn.dart';
import 'package:beep_mobile/app/controllers/onboardin.dart';
import 'package:get/get.dart';

class OnBoardingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
    Get.put(LanguageActionBtnController(), permanent: true);
  }
}
