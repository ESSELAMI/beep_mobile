import 'package:beep_mobile/app/views/screens/person/person_form.dart';
import 'package:beep_mobile/base/controllers/person.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class PersonScreen extends Screen<BasePersonController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: PersonForm(),
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
    return const PersonForm();
  }
}
