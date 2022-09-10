import 'package:beep_mobile/app/controllers/language_action_btn.dart';
import 'package:beep_mobile/utils/SizeConfig.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LanguageActionBtn extends GetView<LanguageActionBtnController> {
  const LanguageActionBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: PopupMenuButton(
        icon: Icon(
          MdiIcons.earth,
          color: AppTheme.getThemeFromThemeMode().colorScheme.primary,
          size: MySize.size32,
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              value: "ar",
              child: const Center(
                child: Text(
                  "العربية",
                ),
              ),
              onTap: () async => controller.changeLang("ar"),
            ),
            PopupMenuItem(
                value: "en",
                child: const Center(
                  child: Text(
                    "English",
                  ),
                ),
                onTap: () async => controller.changeLang("en")),
            PopupMenuItem(
                value: "fr",
                child: const Center(
                  child: Text(
                    "Français",
                  ),
                ),
                onTap: () async => controller.changeLang("fr")),
          ];
        },
      ),
    );
  }
}
