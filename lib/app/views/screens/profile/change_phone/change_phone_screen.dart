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
import 'package:slide_countdown/slide_countdown.dart';
import 'package:sms_autofill/sms_autofill.dart';

class ChangePhoneWidget extends GetView<ProfileController> {
  const ChangePhoneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(MySize.size32!),
        child: controller.obx((state) => Card(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Visibility(
                        visible: !controller.showOTP,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(16),
                              child: Text(LocaleKeys.label_change_phone.tr,
                                  style: AppTheme.getTextStyle(
                                      AppTheme.getThemeFromThemeMode()
                                          .textTheme
                                          .bodyText1,
                                      fontWeight: 600,
                                      letterSpacing: 0)),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    MdiIcons.phoneOutline,
                                    size: 22,
                                    color: AppTheme.getThemeFromThemeMode()
                                        .colorScheme
                                        .onBackground
                                        .withAlpha(200),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: controller.user.phone == ""
                                        ? Text(
                                            LocaleKeys.label_not_available.tr,
                                            style: AppTheme.getTextStyle(
                                                AppTheme.getThemeFromThemeMode()
                                                    .textTheme
                                                    .bodyText1,
                                                fontWeight: 600,
                                                letterSpacing: 0))
                                        : Text(
                                            controller.user.phone.toString(),
                                            style: AppTheme.getTextStyle(
                                                AppTheme.getThemeFromThemeMode()
                                                    .textTheme
                                                    .subtitle2,
                                                letterSpacing: 0.1,
                                                color: AppTheme
                                                        .getThemeFromThemeMode()
                                                    .colorScheme
                                                    .onBackground,
                                                fontWeight: 500),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: controller.newPhoneNumberController,
                              style: AppTheme.getTextStyle(
                                  AppTheme.getThemeFromThemeMode()
                                      .textTheme
                                      .bodyText2,
                                  letterSpacing: 0.1,
                                  color: AppTheme.getThemeFromThemeMode()
                                      .colorScheme
                                      .onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                // prefixText: "+91 ",
                                hintStyle: AppTheme.getTextStyle(
                                    AppTheme.getThemeFromThemeMode()
                                        .textTheme
                                        .subtitle2,
                                    letterSpacing: 0.1,
                                    color: AppTheme.getThemeFromThemeMode()
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: 500),
                                hintText: LocaleKeys.label_new_phone_number.tr,
                                prefixStyle: AppTheme.getTextStyle(
                                    AppTheme.getThemeFromThemeMode()
                                        .textTheme
                                        .subtitle2,
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
                                fillColor: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .background,
                                prefixIcon: Icon(
                                  MdiIcons.phoneOutline,
                                  size: 22,
                                  color: AppTheme.getThemeFromThemeMode()
                                      .colorScheme
                                      .onBackground
                                      .withAlpha(200),
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller:
                                  controller.confirmPhoneNumberController,
                              style: AppTheme.getTextStyle(
                                  AppTheme.getThemeFromThemeMode()
                                      .textTheme
                                      .bodyText2,
                                  letterSpacing: 0.1,
                                  color: AppTheme.getThemeFromThemeMode()
                                      .colorScheme
                                      .onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                // prefixText: "+91 ",
                                hintStyle: AppTheme.getTextStyle(
                                    AppTheme.getThemeFromThemeMode()
                                        .textTheme
                                        .subtitle2,
                                    letterSpacing: 0.1,
                                    color: AppTheme.getThemeFromThemeMode()
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: 500),
                                hintText: LocaleKeys.label_confirm_phone.tr,
                                prefixStyle: AppTheme.getTextStyle(
                                    AppTheme.getThemeFromThemeMode()
                                        .textTheme
                                        .caption,
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
                                fillColor: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .background,
                                prefixIcon: Icon(
                                  MdiIcons.phoneOutline,
                                  size: 22,
                                  color: AppTheme.getThemeFromThemeMode()
                                      .colorScheme
                                      .onBackground
                                      .withAlpha(200),
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                      width: MySize.safeWidth! * 0.3,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      child: RoundedLoadingButton(
                                        height: MySize.size48!,
                                        elevation: 2,
                                        borderRadius: 8,
                                        color: AppTheme.getThemeFromThemeMode()
                                            .primaryColor,
                                        child: Text(LocaleKeys.label_change.tr,
                                            style: AppTheme.getTextStyle(
                                                AppTheme.getThemeFromThemeMode()
                                                    .textTheme
                                                    .bodyText1,
                                                fontWeight: 800,
                                                color: Colors.white)),
                                        controller: controller
                                            .changePhoneButtonController,
                                        onPressed: () => controller.sendOTP(),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: controller.showOTP,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MySize.size60,
                              ),
                              Container(
                                margin: const EdgeInsets.all(16),
                                child: Text(
                                    LocaleKeys.label_sms_verification.tr,
                                    style: AppTheme.getTextStyle(
                                        AppTheme.getThemeFromThemeMode()
                                            .textTheme
                                            .bodyText2,
                                        fontWeight: 600,
                                        letterSpacing: 0)),
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                      bottom: MySize.size16!,
                                      top: MySize.size8!),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: MySize.safeWidth! * 0.55,
                                        child: PinFieldAutoFill(
                                          cursor: Cursor(
                                              color: Colors.blueAccent,
                                              enabled: true,
                                              width: 2),
                                          // textInputAction: null,
                                          autoFocus: true,
                                          codeLength: 4,
                                          decoration: BoxLooseDecoration(
                                            bgColorBuilder:
                                                const FixedColorBuilder(
                                                    Color(0xffc5def2)),
                                            textStyle: AppTheme.getTextStyle(
                                                AppTheme.getThemeFromThemeMode()
                                                    .textTheme
                                                    .subtitle1,
                                                fontWeight: 700,
                                                letterSpacing: 0.2),
                                            strokeColorBuilder:
                                                const FixedColorBuilder(
                                                    Color(0xffc5def2)),
                                          ),
                                          onCodeChanged: (code) {
                                            controller.setSMSCode(code!);
                                          },
                                          onCodeSubmitted: (code) async {
                                            controller.setSMSCode(code);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: MySize.size50,
                                      ),
                                      Visibility(
                                        visible: controller.expiresIn > 0,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                    LocaleKeys
                                                        .label_sms_expires_in
                                                        .tr,
                                                    style: AppTheme.getTextStyle(
                                                        AppTheme.getThemeFromThemeMode()
                                                            .textTheme
                                                            .caption,
                                                        fontWeight: 600,
                                                        letterSpacing: 0.2)),
                                                Directionality(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  child: SlideCountdown(
                                                    decoration: const BoxDecoration(
                                                        // color: AppTheme.getThemeFromThemeMode(),
                                                        ),
                                                    duration: Duration(
                                                        seconds: controller
                                                            .expiresIn),
                                                    slideDirection:
                                                        SlideDirection.down,
                                                    separator: ":",
                                                    textStyle:
                                                        AppTheme.getTextStyle(
                                                            AppTheme.getThemeFromThemeMode()
                                                                .textTheme
                                                                .caption,
                                                            fontWeight: 600,
                                                            letterSpacing: 0.2),
                                                    onDone: () {
                                                      controller.setTimer();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MySize.size16,
                                            ),
                                            Container(
                                                width: MySize.safeWidth! * 0.3,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                child: RoundedLoadingButton(
                                                  animateOnTap: true,
                                                  height: MySize.size48!,
                                                  elevation: 2,
                                                  borderRadius: 8,
                                                  color: AppTheme
                                                          .getThemeFromThemeMode()
                                                      .primaryColor,
                                                  child: Text(
                                                      LocaleKeys.label_send.tr,
                                                      style: AppTheme.getTextStyle(
                                                          AppTheme.getThemeFromThemeMode()
                                                              .textTheme
                                                              .bodyText1,
                                                          fontWeight: 800,
                                                          color: Colors.white)),
                                                  controller: controller
                                                      .sendButtonController,
                                                  onPressed: () =>
                                                      controller.confirmOTP(),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: controller.expiresIn == 0,
                                        child: Column(
                                          children: [
                                            Container(
                                                // width: MySize.safeWidth! * 0.3,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                child: RoundedLoadingButton(
                                                  height: MySize.size48!,
                                                  elevation: 2,
                                                  borderRadius: 8,
                                                  color: AppTheme
                                                          .getThemeFromThemeMode()
                                                      .primaryColor,
                                                  child: Text(
                                                      LocaleKeys
                                                          .label_resend_sms.tr,
                                                      style: AppTheme.getTextStyle(
                                                          AppTheme.getThemeFromThemeMode()
                                                              .textTheme
                                                              .bodyText1,
                                                          fontWeight: 800,
                                                          color: Colors.white)),
                                                  controller: controller
                                                      .resendButtonController,
                                                  onPressed: () =>
                                                      controller.resendOTP(),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            )));
  }

  // Row buildTimer() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text(
  //         LocaleKeys.label_sms_expires_in.tr,
  //       ),
  //       // TweenAnimationBuilder(
  //       //   tween: Tween(begin: 120.0, end: 0.0),
  //       //   duration: Duration(seconds: 120),
  //       //   builder: (_, value, child) => Text(
  //       //     "${value.toInt()}:${value.toInt() / 2}",
  //       //     style: TextStyle(color: kPrimaryColor),
  //       //   ),
  //       // ),
  //       Directionality(
  //         textDirection: TextDirection.ltr,
  //         child:
  //       ),
  //     ],
  //   );
  // }
}
