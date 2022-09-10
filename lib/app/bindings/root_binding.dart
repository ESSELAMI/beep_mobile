import 'package:beep_mobile/app/controllers/drawer.dart';
import 'package:beep_mobile/app/controllers/root_controller.dart';
import 'package:beep_mobile/app/controllers/splash_screen.dart';
import 'package:get/get.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );

    Get.put(DrawerWidgetController(), permanent: true);
    Get.put(SplashController(), permanent: true);
  }
}
