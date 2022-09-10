/*
* File : Account Setting
* Version : 1.0.0
* */

import 'package:beep_mobile/app/controllers/profile.dart';
import 'package:beep_mobile/utils/SizeConfig.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ChangePasswordWidget extends GetView<ProfileController> {
  const ChangePasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MySize.size32!),
      child: controller.obx((state) => Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ListView(
                padding: EdgeInsets.all(MySize.size16!),
                children: <Widget>[
                  Center(
                    child: Text(LocaleKeys.title_change_password.tr,
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .bodyText1,
                            fontWeight: 600,
                            letterSpacing: 0)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size16!),
                    child: TextFormField(
                      controller: controller.oldPasswordController,
                      style: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                          letterSpacing: 0,
                          color: AppTheme.getThemeFromThemeMode()
                              .colorScheme
                              .onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: LocaleKeys.label_old_password.tr,
                        hintStyle: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .subtitle2,
                            letterSpacing: 0,
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
                        fillColor: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .background,
                        prefixIcon: const Icon(MdiIcons.lockOpenOutline),
                        suffixIcon: IconButton(
                          icon: Icon(controller.showOldPass
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline),
                          onPressed: () {
                            controller.changeVisibility(0);
                          },
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: !controller.showOldPass,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size12!),
                    child: TextFormField(
                      controller: controller.newPasswordController,
                      style: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                          letterSpacing: 0,
                          color: AppTheme.getThemeFromThemeMode()
                              .colorScheme
                              .onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: LocaleKeys.label_new_password.tr,
                        hintStyle: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .subtitle2,
                            letterSpacing: 0,
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
                        fillColor: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .background,
                        prefixIcon: const Icon(MdiIcons.lockOutline),
                        suffixIcon: IconButton(
                          icon: Icon(controller.showNewPass
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline),
                          onPressed: () {
                            controller.changeVisibility(1);
                          },
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: !controller.showNewPass,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size12!),
                    child: TextFormField(
                      controller: controller.confirmPasswordController,
                      style: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                          letterSpacing: 0,
                          color: AppTheme.getThemeFromThemeMode()
                              .colorScheme
                              .onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: LocaleKeys.label_confirm_password.tr,
                        hintStyle: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .subtitle2,
                            letterSpacing: 0,
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
                        fillColor: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .background,
                        prefixIcon: const Icon(MdiIcons.lockOutline),
                        suffixIcon: IconButton(
                          icon: Icon(controller.showConfirmPass
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline),
                          onPressed: () {
                            controller.changeVisibility(2);
                          },
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: !controller.showConfirmPass,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: MySize.size24!),
                    child: Center(
                      child: Container(
                          width: MySize.safeWidth! * 0.3,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: RoundedLoadingButton(
                            height: MySize.size48!,
                            elevation: 2,
                            borderRadius: 8,
                            color:
                                AppTheme.getThemeFromThemeMode().primaryColor,
                            child: Text(LocaleKeys.label_change.tr,
                                style: AppTheme.getTextStyle(
                                    AppTheme.getThemeFromThemeMode()
                                        .textTheme
                                        .bodyText1,
                                    fontWeight: 800,
                                    color: Colors.white)),
                            controller:
                                controller.changePasswordButtonController,
                            onPressed: () => controller.updatePassword(),
                          )),
                    ),
                  ),
                  // Visibility(
                  //   child: Center(child: CircularProgressIndicator()),
                  //   visible: controller.isLoading,
                  // )
                ],
              ),
            ),
          )),
    );
  }
}
