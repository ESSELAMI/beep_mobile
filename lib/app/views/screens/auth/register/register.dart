// ignore_for_file: use_key_in_widget_constructors

import 'package:beep_mobile/app/views/screens/auth/register/components/register_form.dart';

import 'package:beep_mobile/base/controllers/register.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends Screen<BaseRegisterController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: RegisterForm(),
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
    return const RegisterForm();
  }
}
