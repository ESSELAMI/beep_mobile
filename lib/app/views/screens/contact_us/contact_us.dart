// ignore_for_file: use_key_in_widget_constructors

import 'package:beep_mobile/app/views/screens/contact_us/contact_us_screen.dart';
import 'package:beep_mobile/base/controllers/contact_us.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class ContactScreen extends Screen<BaseContactController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: ContactForm(),
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
    return const ContactForm();
  }
}
