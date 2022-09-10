import 'package:beep_mobile/base/controllers/contact_us.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends BaseContactController {
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

  makePhoneCall(String number) {
    launch('tel://$number');
  }

  openUrl(String url) {
    launch('https://$url');
  }

  openEmail(String address) {
    launch('mailto://$address?subject=""&body=""');
  }
}
