// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:beep_mobile/app/views/screens/auth/register_success/components/register_success.dart';

import 'package:beep_mobile/base/controllers/register_success.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class RegisterSuccessScreen extends Screen<BaseRegisterSuccessController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: RegisterSuccessForm(),
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
    return RegisterSuccessForm();
  }
}
