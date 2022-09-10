// ignore_for_file: use_key_in_widget_constructors

import 'package:beep_mobile/app/views/screens/home/home_screen.dart';
import 'package:beep_mobile/base/controllers/home.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends Screen<BaseHomeController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: HomeForm(),
          ),
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
    return const HomeForm();
  }
}
