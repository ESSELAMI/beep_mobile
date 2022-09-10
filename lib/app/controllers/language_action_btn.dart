import 'package:beep_mobile/app/services/local/locale_service.dart';
import 'package:beep_mobile/base/controllers/language_action_btn.dart';

class LanguageActionBtnController extends BaseLanguageActionBtnController {
  changeLang(String lang) async {
    LocaleService().switchLocale(lang);
  }

  getLang() async {
    LocaleService().loadLocalFromBox();
  }
}
