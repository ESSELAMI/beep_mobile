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

class UserInfoWidget extends GetView<ProfileController> {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: controller.obx((state) => Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleKeys.label_information.tr,
                            style: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .bodyText1,
                                fontWeight: 600,
                                letterSpacing: 0)),
                        // GestureDetector(
                        //   onTap: () => {controller.showTermsDialog()},
                        //   child: Icon(
                        //     MdiIcons.accountEdit,
                        //     color: AppTheme.getThemeFromThemeMode()
                        //         .colorScheme
                        //         .primary,
                        //     size: 26,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  controller.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.cardAccountDetails,
                                        size: 28,
                                        color: AppTheme.getThemeFromThemeMode()
                                            .colorScheme
                                            .onBackground),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                LocaleKeys
                                                    .label_social_security_number
                                                    .tr,
                                                style: AppTheme.getTextStyle(
                                                    AppTheme.getThemeFromThemeMode()
                                                        .textTheme
                                                        .caption,
                                                    fontWeight: 600)),
                                            Text(
                                                controller.user.noAssure
                                                    .toString(),
                                                style: AppTheme.getTextStyle(
                                                    AppTheme.getThemeFromThemeMode()
                                                        .textTheme
                                                        .subtitle2,
                                                    fontWeight: 600))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.3,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.accountOutline,
                                        size: 28,
                                        color: AppTheme.getThemeFromThemeMode()
                                            .colorScheme
                                            .onBackground),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    LocaleKeys
                                                        .label_full_name.tr,
                                                    style: AppTheme.getTextStyle(
                                                        AppTheme.getThemeFromThemeMode()
                                                            .textTheme
                                                            .caption,
                                                        fontWeight: 600)),
                                                Text(
                                                    controller.user.frFullName
                                                        .toString(),
                                                    style: AppTheme.getTextStyle(
                                                        AppTheme.getThemeFromThemeMode()
                                                            .textTheme
                                                            .subtitle2,
                                                        fontWeight: 600))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              controller.user.arFullName
                                          .toString()
                                          .isNotEmpty &&
                                      controller.user.arFullName !=
                                          controller.user.frFullName
                                  ? Column(
                                      children: [
                                        const Divider(
                                          thickness: 0.3,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(MdiIcons.accountOutline,
                                                  size: 28,
                                                  color: AppTheme
                                                          .getThemeFromThemeMode()
                                                      .colorScheme
                                                      .onBackground),
                                              Expanded(
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 16, right: 16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              LocaleKeys
                                                                  .label_full_name_ar
                                                                  .tr,
                                                              style: AppTheme.getTextStyle(
                                                                  AppTheme.getThemeFromThemeMode()
                                                                      .textTheme
                                                                      .caption,
                                                                  fontWeight:
                                                                      600)),
                                                          Text(
                                                              controller.user
                                                                  .arFullName
                                                                  .toString(),
                                                              style: AppTheme.getTextStyle(
                                                                  AppTheme.getThemeFromThemeMode()
                                                                      .textTheme
                                                                      .subtitle2,
                                                                  fontWeight:
                                                                      600))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.3,
                                        ),
                                      ],
                                    )
                                  : Container(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.calendarAccount,
                                        size: 28,
                                        color: AppTheme.getThemeFromThemeMode()
                                            .colorScheme
                                            .onBackground),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(LocaleKeys.label_birthdate.tr,
                                                style: AppTheme.getTextStyle(
                                                    AppTheme.getThemeFromThemeMode()
                                                        .textTheme
                                                        .caption,
                                                    fontWeight: 600)),
                                            Text(
                                                controller.user.birthDate
                                                    .toString(),
                                                style: AppTheme.getTextStyle(
                                                    AppTheme.getThemeFromThemeMode()
                                                        .textTheme
                                                        .subtitle2,
                                                    fontWeight: 600))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.3,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.email,
                                        size: 28,
                                        color: AppTheme.getThemeFromThemeMode()
                                            .colorScheme
                                            .onBackground),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(LocaleKeys.label_email.tr,
                                                style: AppTheme.getTextStyle(
                                                    AppTheme.getThemeFromThemeMode()
                                                        .textTheme
                                                        .caption,
                                                    fontWeight: 600)),
                                            Text(
                                                controller.user.email
                                                    .toString(),
                                                style: AppTheme.getTextStyle(
                                                    AppTheme.getThemeFromThemeMode()
                                                        .textTheme
                                                        .subtitle2,
                                                    fontWeight: 600))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.3,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.homeMapMarker,
                                        size: 28,
                                        color: AppTheme.getThemeFromThemeMode()
                                            .colorScheme
                                            .onBackground),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(LocaleKeys.label_address.tr,
                                                style: AppTheme.getTextStyle(
                                                    AppTheme.getThemeFromThemeMode()
                                                        .textTheme
                                                        .caption,
                                                    fontWeight: 600)),
                                            Text(
                                                controller.user.address
                                                    .toString(),
                                                style: AppTheme.getTextStyle(
                                                    AppTheme.getThemeFromThemeMode()
                                                        .textTheme
                                                        .subtitle2,
                                                    fontWeight: 600))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.3,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.mapMarkerRadius,
                                        size: 28,
                                        color: AppTheme.getThemeFromThemeMode()
                                            .colorScheme
                                            .onBackground),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(LocaleKeys.label_my_center.tr,
                                                style: AppTheme.getTextStyle(
                                                    AppTheme.getThemeFromThemeMode()
                                                        .textTheme
                                                        .caption,
                                                    fontWeight: 600)),
                                            InkWell(
                                              onTap: () => controller.goToMAp(),
                                              child: Text(
                                                  controller.userCenter.address
                                                      .toString(),
                                                  style: AppTheme.getTextStyle(
                                                      AppTheme.getThemeFromThemeMode()
                                                          .textTheme
                                                          .subtitle2,
                                                      fontWeight: 600)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.3,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.downloadBox,
                                        size: 28,
                                        color: AppTheme.getThemeFromThemeMode()
                                            .colorScheme
                                            .onBackground),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () => controller.savePDF(),
                                              child: Text(
                                                  LocaleKeys
                                                      .label_affiliation_document
                                                      .tr,
                                                  style: AppTheme.getTextStyle(
                                                      AppTheme.getThemeFromThemeMode()
                                                          .textTheme
                                                          .caption,
                                                      fontWeight: 600)),
                                            ),
                                            InkWell(
                                              onTap: () => controller.savePDF(),
                                              child: Text(
                                                  LocaleKeys.label_download.tr,
                                                  style: AppTheme.getTextStyle(
                                                      AppTheme.getThemeFromThemeMode()
                                                          .textTheme
                                                          .subtitle2,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      color: AppTheme
                                                              .getThemeFromThemeMode()
                                                          .colorScheme
                                                          .primary)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          )),
    );
  }
}
