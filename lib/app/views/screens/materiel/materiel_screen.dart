import 'package:beep_mobile/app/views/screens/materiel/materiel_form.dart';
import 'package:beep_mobile/base/controllers/materiel.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class MaterielScreen extends Screen<BaseMaterielController> {
  @override
  Widget? desktop() {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: MaterielForm(),
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
    return MaterielForm();
  }
}
