/*
* File : Location Permission Dialog
* Version : 1.0.0
* */

import 'package:beep_mobile/app/controllers/register.dart';
import 'package:beep_mobile/app/controllers/root_controller.dart';
import 'package:beep_mobile/app/views/widgets/button/button.dart';

import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/spacing.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TermsDialog extends GetView<RootController> {
  const TermsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: FxSpacing.all(20),
        decoration: BoxDecoration(
          color: AppTheme.getThemeFromThemeMode().backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      LocaleKeys.label_app_terms.tr,
                      style: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.bodyText1,
                          fontWeight: 600),
                    ),
                  ),
                ),
                Icon(
                  MdiIcons.shieldCheck,
                  color: AppTheme.getThemeFromThemeMode().colorScheme.primary,
                )
              ],
            ),
            Divider(
              color: AppTheme.getThemeFromThemeMode().colorScheme.onBackground,
            ),
            Container(
              margin: FxSpacing.only(top: 8),
              child: RichText(
                text: TextSpan(
                    style: AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                        fontWeight: 600),
                    children: <TextSpan>[
                      TextSpan(
                        text: LocaleKeys.text_terms_of_use.tr,
                      ),
                    ]),
              ),
            ),
            Container(
                margin: FxSpacing.top(24),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxButton(
                        backgroundColor: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .primary,
                        borderRadiusAll: 4,
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          LocaleKeys.label_i_agree.tr,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText1,
                              fontWeight: 600,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onPrimary),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
