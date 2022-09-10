// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey[300],
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarTextStyle: const TextTheme(
        headline1: TextStyle(
          color: Colors.black,
        ),
      ).bodyText2,
      titleTextStyle: const TextTheme(
        headline1: TextStyle(
          color: Colors.black,
        ),
      ).headline6,
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.blueGrey[800],
      appBarTheme: const AppBarTheme(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ));
}
