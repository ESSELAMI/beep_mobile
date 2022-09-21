import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Style {
  static var authStyle = AppTheme.getTextStyle(
      AppTheme.getThemeFromThemeMode().textTheme.headline6,
      letterSpacing: 0,
      fontWeight: 600,
      color: AppTheme.getThemeFromThemeMode().colorScheme.onBackground);

  static var signInStyle = AppTheme.getTextStyle(
      AppTheme.getThemeFromThemeMode().textTheme.bodyText1,
      letterSpacing: 0,
      fontWeight: 500,
      color: AppTheme.getThemeFromThemeMode().colorScheme.onBackground);

  static var userStyle = AppTheme.getTextStyle(
      AppTheme.getThemeFromThemeMode().textTheme.bodyText1,
      letterSpacing: 0,
      fontWeight: 500,
      color: AppTheme.getThemeFromThemeMode().colorScheme.onBackground);

  static var passwordStyle = AppTheme.getTextStyle(
    AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
    letterSpacing: 0,
    height: 1.5,
    fontWeight: 500,
    color: const Color(0xff495057),
  );

  static var userDecoration = InputDecoration(
    hintText: LocaleKeys.label_social_security_number.tr,
    hintStyle: AppTheme.getTextStyle(
        AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
        letterSpacing: 0,
        color: const Color(0xff495057),
        fontWeight: 600),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        borderSide: BorderSide.none),
    enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        borderSide: BorderSide.none),
    focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        borderSide: BorderSide.none),
    filled: true,
    prefixIcon: Icon(
      MdiIcons.account,
      size: 22,
      color: AppTheme.getThemeFromThemeMode().colorScheme.primary,
    ),
    isDense: true,
    contentPadding: const EdgeInsets.only(right: 16),
  );

  static passwordDecoration(IconButton btn) {
    return InputDecoration(
      hintText: LocaleKeys.label_password.tr,
      hintStyle: AppTheme.getTextStyle(
          AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
          letterSpacing: 0,
          color: const Color(0xff495057),
          fontWeight: 600),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide.none),
      enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide.none),
      filled: true,
      prefixIcon: Icon(
        MdiIcons.lock,
        size: 22,
        color: AppTheme.getThemeFromThemeMode().colorScheme.primary,
      ),
      suffixIcon: btn,
      isDense: true,
      contentPadding: const EdgeInsets.only(right: 16),
    );
  }
}
