/*
* File : Location Permission Dialog
* Version : 1.0.0
* */

import 'package:beep_mobile/app/controllers/home.dart';
import 'package:beep_mobile/app/views/widgets/button/button.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/spacing.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CloseAppDialog extends GetView<HomeController> {
  const CloseAppDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: FxSpacing.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: FxSpacing.right(16),
                  child: const Icon(MdiIcons.alert,
                      size: 28, color: Colors.orangeAccent),
                ),
                FxSpacing.width(8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .subtitle1,
                            letterSpacing: 0.4,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onBackground),
                        children: <TextSpan>[
                          TextSpan(text: LocaleKeys.label_confirm_close_app.tr),
                        ]),
                  ),
                )
              ],
            ),
            Container(
                margin: FxSpacing.top(8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxButton(
                      backgroundColor: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .background,
                      elevation: 0,
                      onPressed: () {
                        controller.cancel();
                        Navigator.pop(context);
                      },
                      child: Text(
                        LocaleKeys.label_no.tr,
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .bodyText2,
                            letterSpacing: 0.4,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onBackground),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    FxButton(
                      backgroundColor:
                          AppTheme.getThemeFromThemeMode().colorScheme.error,
                      borderRadiusAll: 4,
                      elevation: 0,
                      onPressed: () {
                        controller.closeApp();
                      },
                      child: Text(
                        LocaleKeys.label_yes.tr,
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .bodyText2,
                            letterSpacing: 0.4,
                            fontWeight: 900,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onPrimary),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
