// ignore_for_file: file_names

import 'package:beep_mobile/utils/theme/theme_type.dart';
import 'package:beep_mobile/app/services/local/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const int themeLight = 1;
  static const int themeDark = 2;
  static ThemeType themeType = ThemeType.light;
  AppTheme._();
  static ThemeData createTheme(ColorScheme colorScheme) {
    if (themeType != ThemeType.light) {
      return darkTheme.copyWith(
        colorScheme: colorScheme,
      );
    }
    return lightTheme.copyWith(colorScheme: colorScheme);
  }

  static ThemeData shoppingTheme = AppTheme.themeType == ThemeType.light
      ? shoppingLightTheme
      : shoppingDarkTheme;

  static ThemeData shoppingLightTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: const Color(0xff1c8c8c),
        primaryContainer: const Color(0xffdafafa),
        secondary: const Color(0xfff15f5f),
        onSecondary: const Color(0xffffffff),
        secondaryContainer: const Color(0xfff8d6d6),
        onSecondaryContainer: const Color(0xff570202)),
  );
  static ThemeData shoppingDarkTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: const Color(0xffcaffff),
        primary: const Color(0xffcaffff),
        onPrimary: const Color(0xff0b7777),
        primaryContainer: const Color(0xff18a6a6),
        onPrimaryContainer: const Color(0xffe5fdfd),
        secondary: const Color(0xffeea6a6),
        onSecondary: const Color(0xff491818),
        secondaryContainer: const Color(0xff7a2f2f),
        onSecondaryContainer: const Color(0xffefdada),
        onBackground: const Color(0xffe6e1e5)),
  );
  static CustomAppTheme getCustomAppTheme() {
    int themeMode = ThemeService().theme == ThemeMode.dark ? 2 : 1;
    if (themeMode == themeLight) {
      return CustomAppTheme.lightCustomAppTheme;
    } else if (themeMode == themeDark) {
      return CustomAppTheme.darkCustomAppTheme;
    }
    return CustomAppTheme.darkCustomAppTheme;
  }

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w300;
      case 500:
        return FontWeight.w400;
      case 600:
        return FontWeight.w500;
      case 700:
        return FontWeight.w600;
      case 800:
        return FontWeight.w700;
      case 900:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle getTextStyle(TextStyle? textStyle,
      {int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double letterSpacing = 0.15,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    double? finalFontSize = fontSize ?? textStyle!.fontSize;

    Color? finalColor;
    if (color == null) {
      finalColor = xMuted
          ? textStyle!.color!.withAlpha(160)
          : (muted ? textStyle!.color!.withAlpha(200) : textStyle!.color);
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return GoogleFonts.cairo(
        fontSize: finalFontSize,
        fontWeight: _getFontWeight(fontWeight),
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  static TextTheme getTextStyle2() {
    return getThemeFromThemeMode().textTheme;
  }

  //App Bar Text
  static const TextTheme lightAppBarTextTheme = TextTheme(
    headline1:
        TextStyle(fontSize: 102, color: Color(0xff495057), fontFamily: 'cairo'),
    headline2:
        TextStyle(fontSize: 64, color: Color(0xff495057), fontFamily: 'cairo'),
    headline3:
        TextStyle(fontSize: 51, color: Color(0xff495057), fontFamily: 'cairo'),
    headline4:
        TextStyle(fontSize: 36, color: Color(0xff495057), fontFamily: 'cairo'),
    headline5:
        TextStyle(fontSize: 25, color: Color(0xff495057), fontFamily: 'cairo'),
    headline6:
        TextStyle(fontSize: 18, color: Color(0xff495057), fontFamily: 'cairo'),
    subtitle1:
        TextStyle(fontSize: 17, color: Color(0xff495057), fontFamily: 'cairo'),
    subtitle2:
        TextStyle(fontSize: 15, color: Color(0xff495057), fontFamily: 'cairo'),
    bodyText1:
        TextStyle(fontSize: 16, color: Color(0xff495057), fontFamily: 'cairo'),
    bodyText2:
        TextStyle(fontSize: 14, color: Color(0xff495057), fontFamily: 'cairo'),
    button:
        TextStyle(fontSize: 15, color: Color(0xff495057), fontFamily: 'cairo'),
    caption:
        TextStyle(fontSize: 13, color: Color(0xff495057), fontFamily: 'cairo'),
    overline:
        TextStyle(fontSize: 11, color: Color(0xff495057), fontFamily: 'cairo'),
  );
  static const TextTheme darkAppBarTextTheme = TextTheme(
    headline1:
        TextStyle(fontSize: 102, color: Color(0xffffffff), fontFamily: 'cairo'),
    headline2:
        TextStyle(fontSize: 64, color: Color(0xffffffff), fontFamily: 'cairo'),
    headline3:
        TextStyle(fontSize: 51, color: Color(0xffffffff), fontFamily: 'cairo'),
    headline4:
        TextStyle(fontSize: 36, color: Color(0xffffffff), fontFamily: 'cairo'),
    headline5:
        TextStyle(fontSize: 25, color: Color(0xffffffff), fontFamily: 'cairo'),
    headline6:
        TextStyle(fontSize: 20, color: Color(0xffffffff), fontFamily: 'cairo'),
    subtitle1:
        TextStyle(fontSize: 17, color: Color(0xffffffff), fontFamily: 'cairo'),
    subtitle2:
        TextStyle(fontSize: 15, color: Color(0xffffffff), fontFamily: 'cairo'),
    bodyText1:
        TextStyle(fontSize: 16, color: Color(0xffffffff), fontFamily: 'cairo'),
    bodyText2:
        TextStyle(fontSize: 14, color: Color(0xffffffff), fontFamily: 'cairo'),
    button:
        TextStyle(fontSize: 15, color: Color(0xffffffff), fontFamily: 'cairo'),
    caption:
        TextStyle(fontSize: 13, color: Color(0xffffffff), fontFamily: 'cairo'),
    overline:
        TextStyle(fontSize: 11, color: Color(0xffffffff), fontFamily: 'cairo'),
  );

  //Text Themes
  static const TextTheme lightTextTheme = TextTheme(
    headline1:
        TextStyle(fontSize: 102, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    headline2:
        TextStyle(fontSize: 64, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    headline3:
        TextStyle(fontSize: 51, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    headline4:
        TextStyle(fontSize: 36, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    headline5:
        TextStyle(fontSize: 25, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    headline6:
        TextStyle(fontSize: 18, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    subtitle1:
        TextStyle(fontSize: 17, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    subtitle2:
        TextStyle(fontSize: 15, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    bodyText1:
        TextStyle(fontSize: 16, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    bodyText2:
        TextStyle(fontSize: 14, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    button:
        TextStyle(fontSize: 15, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    caption:
        TextStyle(fontSize: 13, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
    overline:
        TextStyle(fontSize: 11, color: Color(0xff4a4c4f), fontFamily: 'cairo'),
  );
  static const TextTheme darkTextTheme = TextTheme(
    headline1:
        TextStyle(fontSize: 102, color: Colors.white, fontFamily: 'cairo'),
    headline2:
        TextStyle(fontSize: 64, color: Colors.white, fontFamily: 'cairo'),
    headline3:
        TextStyle(fontSize: 51, color: Colors.white, fontFamily: 'cairo'),
    headline4:
        TextStyle(fontSize: 36, color: Colors.white, fontFamily: 'cairo'),
    headline5:
        TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'cairo'),
    headline6:
        TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'cairo'),
    subtitle1:
        TextStyle(fontSize: 17, color: Colors.white, fontFamily: 'cairo'),
    subtitle2:
        TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'cairo'),
    bodyText1:
        TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'cairo'),
    bodyText2:
        TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'cairo'),
    button: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'cairo'),
    caption: TextStyle(fontSize: 13, color: Colors.white, fontFamily: 'cairo'),
    overline: TextStyle(fontSize: 11, color: Colors.white, fontFamily: 'cairo'),
  );

  //Color Themes
  static final ThemeData lightTheme = ThemeData(
    hintColor: const Color(0xfff0c5c5),
    brightness: Brightness.light,
    primaryColor: const Color(0xffEB5757),
    canvasColor: Colors.transparent,
    backgroundColor: const Color(0xfff6f6f6),
    scaffoldBackgroundColor: const Color(0xfff6f6f6),
    appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(
        color: Color(0xff495057),
      ),
      color: const Color(0xffffffff),
      iconTheme: const IconThemeData(color: Color(0xff495057), size: 24),
      toolbarTextStyle: lightAppBarTextTheme.bodyText2,
      titleTextStyle: lightAppBarTextTheme.headline6,
    ),
    navigationRailTheme: const NavigationRailThemeData(
        selectedIconTheme:
            IconThemeData(color: Color(0xffEB5757), opacity: 1, size: 24),
        unselectedIconTheme:
            IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
        backgroundColor: Color(0xffffffff),
        elevation: 3,
        selectedLabelTextStyle: TextStyle(color: Color(0xffEB5757)),
        unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.4),
      elevation: 1,
      margin: const EdgeInsets.all(0),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xfff0c5c5),
      hintStyle: TextStyle(fontSize: 15, color: Color(0xaa495057)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Color(0xffEB5757)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.black54),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black54)),
    ),
    splashColor: Colors.white.withAlpha(100),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: lightTextTheme,
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffdcc7ff),
    highlightColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xffEB5757),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: const Color(0xffEB5757),
        hoverColor: const Color(0xffEB5757),
        foregroundColor: Colors.white),
    dividerColor: const Color(0xffd1d1d1),
    errorColor: const Color(0xfff0323c),
    cardColor: Colors.white,
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xffffffff),
      textStyle: lightTextTheme.bodyText2!
          .merge(const TextStyle(color: Color(0xff495057))),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xffEB5757),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xffEB5757), width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xffEB5757),
      inactiveTrackColor: const Color(0xffEB5757).withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xffEB5757),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
            primary: Color(0xffEB5757),
            onPrimary: Colors.white,
            secondary: Color(0xff495057),
            onSecondary: Colors.white,
            surface: Color(0xffe2e7f1),
            background: Color(0xfff3f4f7),
            onBackground: Color(0xff495057))
        .copyWith(secondary: const Color(0xffEB5757)),
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      canvasColor: Colors.transparent,
      primaryColor: const Color(0xffEB5757),
      hintColor: const Color(0xfff0c5c5),
      scaffoldBackgroundColor: const Color(0xff1b1b1b),
      backgroundColor: const Color(0xff1b1b1b),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1b1b1b)),
      cardTheme: const CardTheme(
        color: Color(0xff37404a),
        shadowColor: Color(0xff000000),
        elevation: 1,
        margin: EdgeInsets.all(0),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      textTheme: darkTextTheme,
      indicatorColor: Colors.white,
      disabledColor: const Color(0xffa3a3a3),
      highlightColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xfff0c5c5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xffEB5757)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.white70),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white70)),
      ),
      dividerColor: const Color(0xff363636),
      errorColor: Colors.orange,
      cardColor: const Color(0xff282a2b),
      splashColor: Colors.white.withAlpha(100),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xffEB5757),
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: const Color(0xffEB5757),
          hoverColor: const Color(0xffEB5757),
          foregroundColor: Colors.white),
      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xff37404a),
        textStyle: lightTextTheme.bodyText2!
            .merge(const TextStyle(color: Color(0xffffffff))),
      ),
      bottomAppBarTheme:
          const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Color(0xff495057),
        labelColor: Color(0xffEB5757),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xffEB5757), width: 2.0),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: const Color(0xffEB5757),
        inactiveTrackColor: const Color(0xffEB5757).withAlpha(100),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: const Color(0xffEB5757),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xffEB5757),
        secondary: Color(0xff00cc77),
        background: Color(0xff1b1b1b),
        onPrimary: Colors.white,
        onBackground: Colors.white,
        onSecondary: Colors.white,
        surface: Color(0xff585e63),
      ).copyWith(secondary: const Color(0xffEB5757)));

  static ThemeData getThemeFromThemeMode() {
    int themeMode = ThemeService().theme == ThemeMode.dark ? 2 : 1;

    if (themeMode == themeLight) {
      return lightTheme;
    } else if (themeMode == themeDark) {
      return darkTheme;
    }
    return lightTheme;
  }

  static NavigationBarTheme getNavigationThemeFromMode() {
    int themeMode = ThemeService().theme == ThemeMode.dark ? 2 : 1;
    NavigationBarTheme navigationBarTheme = NavigationBarTheme();
    if (themeMode == themeLight) {
      navigationBarTheme.backgroundColor = Colors.white;
      navigationBarTheme.selectedItemColor = const Color(0xffEB5757);
      navigationBarTheme.unselectedItemColor = const Color(0xff495057);
      navigationBarTheme.selectedOverlayColor = const Color(0x380b479d);
    } else if (themeMode == themeDark) {
      navigationBarTheme.backgroundColor = const Color(0xff37404a);
      navigationBarTheme.selectedItemColor = const Color(0xff37404a);
      navigationBarTheme.unselectedItemColor = const Color(0xffd1d1d1);
      navigationBarTheme.selectedOverlayColor = const Color(0xffffffff);
    }
    return navigationBarTheme;
  }
}

class CustomAppTheme {
  final Color bgLayer1,
      bgLayer2,
      bgLayer3,
      bgLayer4,
      border1,
      border2,
      disabledColor,
      onDisabled,
      colorInfo,
      colorWarning,
      colorSuccess,
      colorError,
      shadowColor,
      onInfo,
      onWarning,
      onSuccess,
      onError,
      shimmerBaseColor,
      shimmerHighlightColor;

  final Color groceryBg1, groceryBg2;
  final Color groceryPrimary, groceryOnPrimary;

  final Color medicarePrimary, medicareOnPrimary;

  final Color cookifyPrimary, cookifyOnPrimary;

  final Color lightBlack,
      red,
      green,
      yellow,
      orange,
      blue,
      purple,
      pink,
      brown,
      violet,
      indigo;

  final Color estatePrimary,
      estateOnPrimary,
      estateSecondary,
      estateOnSecondary;
  final Color datingPrimary,
      datingOnPrimary,
      datingSecondary,
      datingOnSecondary;

  final Color homemadePrimary,
      homemadeSecondary,
      homemadeOnPrimary,
      homemadeOnSecondary;

  CustomAppTheme({
    this.border1 = const Color(0xffeeeeee),
    this.border2 = const Color(0xffe6e6e6),
    this.bgLayer1 = const Color(0xffffffff),
    this.bgLayer2 = const Color(0xfff8faff),
    this.bgLayer3 = const Color(0xfff8f8f8),
    this.bgLayer4 = const Color(0xffdcdee3),
    this.disabledColor = const Color(0xffdcc7ff),
    this.onDisabled = const Color(0xffffffff),
    this.colorWarning = const Color(0xffffc837),
    this.colorInfo = const Color(0xffff784b),
    this.colorSuccess = const Color(0xff3cd278),
    this.shadowColor = const Color(0xff1f1f1f),
    this.onInfo = const Color(0xffffffff),
    this.onWarning = const Color(0xffffffff),
    this.onSuccess = const Color(0xffffffff),
    this.colorError = const Color(0xfff0323c),
    this.onError = const Color(0xffffffff),
    this.shimmerBaseColor = const Color(0xFFF5F5F5),
    this.shimmerHighlightColor = const Color(0xFFE0E0E0),
    //Grocery color scheme

    this.groceryPrimary = const Color(0xff10bb6b),
    this.groceryOnPrimary = const Color(0xffffffff),
    this.groceryBg1 = const Color(0xfffbfbfb),
    this.groceryBg2 = const Color(0xfff5f5f5),

    //Cookify
    this.cookifyPrimary = const Color(0xffdf7463),
    this.cookifyOnPrimary = const Color(0xffffffff),

    //Color
    this.lightBlack = const Color(0xffa7a7a7),
    this.red = const Color(0xffFF0000),
    this.green = const Color(0xff008000),
    this.yellow = const Color(0xfffff44f),
    this.orange = const Color(0xffFFA500),
    this.blue = const Color(0xff0000ff),
    this.purple = const Color(0xff800080),
    this.pink = const Color(0xffFFC0CB),
    this.brown = const Color(0xffA52A2A),
    this.indigo = const Color(0xff4B0082),
    this.violet = const Color(0xff9400D3),

    //Medicare Color Scheme
    this.medicarePrimary = const Color(0xff6d65df),
    this.medicareOnPrimary = const Color(0xffffffff),

    //Estate Color Scheme
    this.estatePrimary = const Color(0xff1c8c8c),
    this.estateOnPrimary = const Color(0xffffffff),
    this.estateSecondary = const Color(0xfff15f5f),
    this.estateOnSecondary = const Color(0xffffffff),

    //Dating Color Scheme
    this.datingPrimary = const Color(0xffB428C3),
    this.datingOnPrimary = const Color(0xffffffff),
    this.datingSecondary = const Color(0xfff15f5f),
    this.datingOnSecondary = const Color(0xffffffff),

    //Homemade Color Scheme
    this.homemadePrimary = const Color(0xffc5558e),
    this.homemadeSecondary = const Color(0xffCC9D60),
    this.homemadeOnPrimary = const Color(0xffffffff),
    this.homemadeOnSecondary = const Color(0xffffffff),
  });

  //--------------------------------------  Custom App Theme ----------------------------------------//

  static final CustomAppTheme lightCustomAppTheme = CustomAppTheme(
      bgLayer1: const Color(0xffffffff),
      bgLayer2: const Color(0xfff9f9f9),
      bgLayer3: const Color(0xffe8ecf4),
      bgLayer4: const Color(0xffdcdee3),
      disabledColor: const Color(0xff636363),
      onDisabled: const Color(0xffffffff),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xffd9d9d9),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      onError: const Color(0xffffffff),
      shimmerBaseColor: const Color(0xFFF5F5F5),
      shimmerHighlightColor: const Color(0xFFE0E0E0));

  static final CustomAppTheme darkCustomAppTheme = CustomAppTheme(
      bgLayer1: const Color(0xff212429),
      bgLayer2: const Color(0xff282930),
      bgLayer3: const Color(0xff303138),
      bgLayer4: const Color(0xff383942),
      border1: const Color(0xff303030),
      border2: const Color(0xff363636),
      disabledColor: const Color(0xffbababa),
      onDisabled: const Color(0xff000000),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xff202020),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      onError: const Color(0xffffffff),
      shimmerBaseColor: const Color(0xFF1a1a1a),
      shimmerHighlightColor: const Color(0xFF454545),

      //Grocery Dark
      groceryBg1: const Color(0xff212429),
      groceryBg2: const Color(0xff282930));
}

class NavigationBarTheme {
  Color? backgroundColor,
      selectedItemIconColor,
      selectedItemTextColor,
      selectedItemColor,
      selectedOverlayColor,
      unselectedItemIconColor,
      unselectedItemTextColor,
      unselectedItemColor;
}
