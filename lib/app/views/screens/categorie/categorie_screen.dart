import 'package:beep_mobile/app/views/screens/categorie/categorie_form.dart';
import 'package:beep_mobile/base/controllers/categorie.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class CategorieScreen extends Screen<BaseCategorieController> {
  @override
  Widget? desktop() {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: CategorieForm(),
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
    return const CategorieForm();
  }
}
