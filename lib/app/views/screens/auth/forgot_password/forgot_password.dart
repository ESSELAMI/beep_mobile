// ignore_for_file: use_key_in_widget_constructors

import 'package:beep_mobile/app/views/screens/auth/forgot_password/components/forgot_password_form.dart';

import 'package:beep_mobile/base/controllers/forgot_password.dart';

import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends Screen<BaseForgotPasswordController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: ForgotPasswordForm(),
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
    return const ForgotPasswordForm();
  }
}
