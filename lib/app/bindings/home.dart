import 'package:beep_mobile/app/controllers/home.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
