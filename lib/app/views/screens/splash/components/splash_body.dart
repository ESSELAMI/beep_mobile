import 'package:beep_mobile/app/controllers/splash_screen.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashBody extends GetView<SplashController> {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                // Spacer(flex: 3),
                Image.asset(
                  "assets/images/logo.png",
                  height: 200,
                  width: 200,
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            SpinKitRipple(
              color: AppTheme.getThemeFromThemeMode().primaryColor,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
