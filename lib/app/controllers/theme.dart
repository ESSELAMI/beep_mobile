import 'package:beep_mobile/app/services/local/theme_service.dart';
import 'package:beep_mobile/base/controllers/theme.dart';
import 'package:flutter/material.dart';

class ThemeController extends BaseThemeController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  changeTheme() {
    ThemeService().switchTheme();
  }
}
