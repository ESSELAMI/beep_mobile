import 'package:get_storage/get_storage.dart';

class OnBoardingService {
  final _box = GetStorage();
  final _key = 'isFirst';

  /// Get isDarkMode info from local storage and return ThemeMode
  bool get first => _loadFromBox() ? true : false;

  /// Switch theme and save to local storage
  void switchOnBoarding() {
    _saveToBox(!_loadFromBox());
  }

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadFromBox() => _box.read(_key) ?? true;

  /// Save isDarkMode to local storage
  _saveToBox(bool isFirst) => _box.write(_key, isFirst);
}
