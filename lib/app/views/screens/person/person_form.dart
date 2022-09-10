import 'package:beep_mobile/app/controllers/person.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PersonForm extends GetView<PersonController> {
  const PersonForm({Key? key}) : super(key: key);

// Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            // controller.changePage();
            // Navigator.of(context).pop();
          },
          icon: Icon(
            Get.locale.toString() == "ar"
                ? MdiIcons.chevronRight
                : MdiIcons.chevronLeft,
          ),
        ),
        title: Text(
          "person",
          style: AppTheme.getTextStyle(
              AppTheme.getThemeFromThemeMode().textTheme.subtitle1,
              fontWeight: 600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 2,
          child: Container(),
        ),
      ),
    );
  }
}
