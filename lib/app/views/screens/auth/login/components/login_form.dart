import 'package:beep_mobile/app/views/screens/auth/login/components/style.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:beep_mobile/app/controllers/login.dart';
import 'package:beep_mobile/app/services/local/theme_service.dart';
import 'package:beep_mobile/app/views/components/language_action_btn.dart';

import 'package:beep_mobile/app/views/screens/auth/login/components/background.dart';

import 'package:beep_mobile/utils/SizeConfig.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';

import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return controller.obx(
      (state) => (Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leadingWidth: 120,
          leading: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 55,
                height: 45,
                child: DayNightSwitcher(
                    isDarkModeEnabled: ThemeService().theme == ThemeMode.dark,
                    dayBackgroundColor:
                        AppTheme.getThemeFromThemeMode().primaryColor,
                    onStateChanged: controller.onStateChanged),
              ),
            ],
          ),
          actions: const [LanguageActionBtn()],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MySize.safeHeight! * 0.03),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/images/beep_logo.png",
                    height: 160,
                    width: 160,
                  ),
                ),
                SizedBox(height: MySize.safeHeight! * 0.03),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    LocaleKeys.label_authentification.tr,
                    style: Style.authStyle,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size24!),
                  child: Text(
                    LocaleKeys.label_sign_in_using.tr,
                    textAlign: TextAlign.center,
                    style: Style.signInStyle,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: controller.userNameController,
                    style: Style.userStyle,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.label_social_security_number.tr,
                      hintStyle: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                          letterSpacing: 0,
                          color: const Color(0xff495057),
                          fontWeight: 600),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          borderSide: BorderSide.none),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          borderSide: BorderSide.none),
                      filled: true,
                      prefixIcon: Icon(
                        MdiIcons.account,
                        size: 22,
                        color: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .primary,
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.only(right: 16),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: controller.passwordController,
                    style: Style.passwordStyle,
                    decoration: Style.passwordDecoration(IconButton(
                      icon: Icon(
                        controller.showPass
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        color: const Color(0xff495057),
                      ),
                      onPressed: () {
                        controller.changeVisibility();
                      },
                    )),
                    obscureText: !controller.showPass,
                  ),
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       GestureDetector(
                //         onTap: () => {
                //           controller.goToForgotPassword(),
                //         },
                //         child: Text(
                //           LocaleKeys.label_forgot_password.tr,
                //           style: TextStyle(
                //             color: AppTheme.getThemeFromThemeMode()
                //                 .primaryColor
                //                 .withOpacity(0.8),
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: MySize.safeWidth! * 0.4,
                  height: MySize.size56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: RoundedLoadingButton(
                      color: AppTheme.getThemeFromThemeMode().primaryColor,
                      controller: controller.loginButtonController,
                      onPressed: () => controller.login(),
                      child: Text(LocaleKeys.label_login.tr,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .subtitle2,
                              color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: MySize.safeHeight! * 0.015),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(
                //       LocaleKeys.label_no_account.tr,
                //       style: TextStyle(
                //         color: AppTheme.getThemeFromThemeMode()
                //             .primaryColor
                //             .withOpacity(0.9),
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 8,
                //     ),
                //     GestureDetector(
                //       onTap: () => {
                //         controller.goToRegister(),
                //       },
                //       child: Text(
                //         LocaleKeys.label_register.tr,
                //         style: TextStyle(
                //           color: AppTheme.getThemeFromThemeMode()
                //               .primaryColor
                //               .withOpacity(0.8),
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
