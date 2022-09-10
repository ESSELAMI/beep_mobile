// ignore_for_file: use_key_in_widget_constructors

import 'package:beep_mobile/app/views/screens/auth/login/components/login_form.dart';

import 'package:beep_mobile/base/controllers/login.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends Screen<BaseLoginController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: LoginForm(),
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
    return const LoginForm();
  }
}
