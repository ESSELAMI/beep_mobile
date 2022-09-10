// ignore_for_file: use_key_in_widget_constructors

import 'package:beep_mobile/app/views/screens/profile/profile_screen.dart';
import 'package:beep_mobile/base/controllers/profile.dart';
import 'package:flutter/material.dart';

import 'package:beep_mobile/core/screen.dart';

class ProfileScreen extends Screen<BaseProfileController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: ProfileWidget(),
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
    return const ProfileWidget();
  }
}
