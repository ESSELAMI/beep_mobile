import 'package:beep_mobile/app/controllers/scanner.dart';
import 'package:get/get.dart';

class ScannerBindings implements Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController(), permanent: true);
    Get.lazyPut<ScannerController>(() => ScannerController(), fenix: true);
  }
}
