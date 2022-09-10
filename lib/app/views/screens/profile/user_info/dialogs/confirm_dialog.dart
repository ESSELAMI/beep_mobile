/*
* File : Location Permission Dialog
* Version : 1.0.0
* */

import 'package:beep_mobile/app/controllers/profile.dart';
import 'package:beep_mobile/app/views/widgets/button/button.dart';
import 'package:beep_mobile/utils/SizeConfig.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/spacing.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ConfirmDialog extends GetView<ProfileController> {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: FxSpacing.all(20),
        decoration: BoxDecoration(
          color: AppTheme.getThemeFromThemeMode().cardColor,
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
                      LocaleKeys.label_change_information.tr,
                      style: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.bodyText1,
                          fontWeight: 600),
                    ),
                  ),
                ),
                Icon(
                  MdiIcons.squareEditOutline,
                  color: AppTheme.getThemeFromThemeMode().colorScheme.primary,
                )
              ],
            ),
            Divider(
              color: AppTheme.getThemeFromThemeMode().colorScheme.onBackground,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              child: TextFormField(
                controller: controller.lastNameArController,
                style: AppTheme.getTextStyle(
                    AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                    height: 2,
                    letterSpacing: 0.1,
                    color: AppTheme.getThemeFromThemeMode()
                        .colorScheme
                        .onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  hintStyle: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground,
                      fontWeight: 500),
                  hintText: LocaleKeys.label_lastname_ar.tr,
                  labelText: LocaleKeys.label_lastname_ar.tr,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                      fontWeight: 800,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground),
                  prefixStyle: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground,
                      fontWeight: 500),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor:
                      AppTheme.getThemeFromThemeMode().colorScheme.background,
                  prefixIcon: Icon(
                    MdiIcons.account,
                    size: 22,
                    color: AppTheme.getThemeFromThemeMode()
                        .colorScheme
                        .onBackground
                        .withAlpha(200),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0),
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              child: TextFormField(
                controller: controller.firstNameArController,
                style: AppTheme.getTextStyle(
                    AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                    height: 2,
                    letterSpacing: 0.1,
                    color: AppTheme.getThemeFromThemeMode()
                        .colorScheme
                        .onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  // prefixText: "+91 ",
                  hintStyle: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground,
                      fontWeight: 500),

                  hintText: LocaleKeys.label_firstname_ar.tr,

                  labelText: LocaleKeys.label_firstname_ar.tr,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                      fontWeight: 800,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground),
                  prefixStyle: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground,
                      fontWeight: 500),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor:
                      AppTheme.getThemeFromThemeMode().colorScheme.background,
                  prefixIcon: Icon(
                    MdiIcons.account,
                    size: 22,
                    color: AppTheme.getThemeFromThemeMode()
                        .colorScheme
                        .onBackground
                        .withAlpha(200),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0),
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              child: TextFormField(
                controller: controller.emailController,
                style: AppTheme.getTextStyle(
                    AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                    height: 2,
                    letterSpacing: 0.1,
                    color: AppTheme.getThemeFromThemeMode()
                        .colorScheme
                        .onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  // prefixText: "+91 ",
                  hintStyle: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground,
                      fontWeight: 500),

                  hintText: LocaleKeys.label_email.tr,

                  labelText: LocaleKeys.label_email.tr,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                      fontWeight: 800,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground),
                  prefixStyle: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                      letterSpacing: 0.1,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground,
                      fontWeight: 500),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor:
                      AppTheme.getThemeFromThemeMode().colorScheme.background,
                  prefixIcon: Icon(
                    MdiIcons.account,
                    size: 22,
                    color: AppTheme.getThemeFromThemeMode()
                        .colorScheme
                        .onBackground
                        .withAlpha(200),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0),
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            Container(
                margin: FxSpacing.top(24),
                alignment: AlignmentDirectional.center,
                child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MySize.safeWidth! * 0.25,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: RoundedLoadingButton(
                          height: 42,
                          elevation: 1,
                          borderRadius: 8,
                          color: AppTheme.getThemeFromThemeMode().primaryColor,
                          child: Text(LocaleKeys.label_change.tr,
                              style: AppTheme.getTextStyle(
                                  AppTheme.getThemeFromThemeMode()
                                      .textTheme
                                      .bodyText2,
                                  fontWeight: 800,
                                  color: Colors.white)),
                          controller: controller.editInfoButtonController,
                          onPressed: () {
                            controller.updateInfo();
                          }),
                    ),
                    // FxButton(
                    //     backgroundColor: AppTheme.getThemeFromThemeMode()
                    //         .colorScheme
                    //         .primary,
                    //     borderRadiusAll: 4,
                    //     elevation: 0,
                    //     onPressed: () {
                    //       controller.sendNewSickLeaveRequest(
                    //           controller.workAccident,
                    //           controller.hospitalisation);
                    //     },
                    //     child: Text(
                    //       LocaleKeys.label_send.tr,
                    //       style: AppTheme.getTextStyle(
                    //           AppTheme.getThemeFromThemeMode()
                    //               .textTheme
                    //               .bodyText1,
                    //           fontWeight: 600,
                    //           color: AppTheme.getThemeFromThemeMode()
                    //               .colorScheme
                    //               .onPrimary),
                    //     )),
                    const SizedBox(width: 16),
                    FxButton(
                        backgroundColor: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                        borderRadiusAll: 4,
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          LocaleKeys.label_cancel.tr,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .subtitle2,
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
