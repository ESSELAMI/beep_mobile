import 'package:beep_mobile/app/models/user/user.dart';
import 'package:beep_mobile/app/services/local/locale_service.dart';
import 'package:beep_mobile/app/services/local/theme_service.dart';
import 'package:beep_mobile/app/services/local/user.dart';
import 'package:beep_mobile/base/controllers/drawer.dart';
import 'package:get/get.dart';

class DrawerWidgetController extends BaseDrawerController {
  static DrawerWidgetController get to => Get.find();
  late String selectedLanguage;
  int selectedPage = 0;
  String previousPage = "";
  String get test => previousPage;
  User user = User();
  int authorized = 0;
  @override
  void onInit() async {
    UserLocalService().getUser().then((value) {
      if (value != null) {
        user = value;
        authorized = 1;
        change(authorized, status: RxStatus.success());
      } else {
        authorized = 0;
        change(authorized, status: RxStatus.success());
      }
    });
    super.onInit();
    setLang();
    change(null, status: RxStatus.success());
    // change(initPage, status: RxStatus.success());
  }

  changePage(int index, String page) {
    selectedPage = index;
    previousPage = page;
    final thenTo =
        Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    Get.rootDelegate.toNamed(thenTo ?? page);

    change(selectedPage, status: RxStatus.success());
  }

  void onStateChanged(bool isDarkModeEnabled) {
    ThemeService().switchTheme();
    change(null, status: RxStatus.success());
  }

  changeLang(String selected) async {
    selectedLanguage = selected;
    String lang;
    if (selectedLanguage == 'English') {
      lang = "en";
    } else if (selectedLanguage == 'Français') {
      lang = "fr";
    } else {
      lang = "ar";
    }
    LocaleService().switchLocale(lang);
    change(null, status: RxStatus.success());
  }

  void setLang() {
    String lang = Get.locale.toString();
    if (lang == 'en') {
      selectedLanguage = "English";
    } else if (lang == 'fr') {
      selectedLanguage = "Français";
    } else {
      selectedLanguage = "العربية";
    }
  }
}
