// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:beep_mobile/app/views/screens/splash/components/splash_body.dart';
import 'package:beep_mobile/base/controllers/splashscreen.dart';
import 'package:beep_mobile/core/screen.dart';

class SplashScreen extends Screen<BaseSplashController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: SplashBody(),
        )
      ],
    );
  }

  @override
  Widget? phone() {
    return Row(
      children: const [
        Expanded(
          child: SplashBody(),
        )
      ],
    );
  }

  @override
  Widget? tablet() {
    return super.tablet();
  }
}
