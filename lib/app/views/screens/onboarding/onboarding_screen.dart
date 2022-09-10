// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:beep_mobile/app/views/screens/onboarding/components/onboarding_body.dart';
import 'package:beep_mobile/base/controllers/splashscreen.dart';
import 'package:beep_mobile/core/screen.dart';

class OnBoardingScreen extends Screen<BaseSplashController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: OnBoardinghBody(),
        )
      ],
    );
  }

  @override
  Widget? tablet() {
    return super.tablet();
  }

  @override
  Widget? phone() {
    return Row(
      children: const [
        Expanded(
          child: OnBoardinghBody(),
        )
      ],
    );
  }
}
