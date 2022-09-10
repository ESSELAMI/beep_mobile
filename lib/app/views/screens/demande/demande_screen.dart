import 'package:beep_mobile/app/views/screens/demande/demande_form.dart';
import 'package:beep_mobile/base/controllers/demande.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class DemandeScreen extends Screen<BaseDemandeController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: DemandeForm(),
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
    return const DemandeForm();
  }
}
