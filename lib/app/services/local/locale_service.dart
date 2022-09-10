import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleService {
  final _box = GetStorage();
  final _key = 'lang';

  /// Get isDarkMode info from local storage and return ThemeMode
  Locale get locale {
    String lang = loadLocalFromBox();
    if (lang == 'ar') {
      return const Locale('ar');
    } else if (lang == 'fr') {
      return const Locale('fr');
    } else {
      return const Locale('en');
    }
  }

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  String loadLocalFromBox() => _box.read(_key) ?? "ar";

  /// Save isDarkMode to local storage
  _saveLocaleToBox(String lang) => _box.write(_key, lang);

  /// Switch theme and save to local storage
  void switchLocale(String lang) {
    Get.updateLocale(Locale(lang));
    _saveLocaleToBox(lang);

    // Get.changeThemeMode(_loadLocalFromBox() ? ThemeMode.light : ThemeMode.dark);
    // _saveThemeToBox(!_loadLocalFromBox());
  }
}
