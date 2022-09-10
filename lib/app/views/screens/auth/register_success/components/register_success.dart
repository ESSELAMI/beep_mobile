import 'package:beep_mobile/app/controllers/register_success.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/views/components/language_action_btn.dart';

import 'package:beep_mobile/app/views/screens/auth/register_success/components/background.dart';

import 'package:beep_mobile/utils/SizeConfig.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';

import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterSuccessForm extends GetView<RegisterSuccessController> {
  const RegisterSuccessForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
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
              Image.asset(
                "assets/images/success.png",
                width: MySize.safeWidth,
                // height: MySize.safeHeight * 0.28,
              ),
              SizedBox(height: MySize.safeHeight! * 0.03),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  LocaleKeys.label_account_created.tr,
                  style: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.headline6,
                      letterSpacing: 0,
                      fontWeight: 600,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: MySize.safeWidth! * 0.4,
                height: MySize.size56,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: RoundedLoadingButton(
                    color: Colors.blueAccent,
                    child: Text(LocaleKeys.label_login.tr,
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .subtitle2,
                            color: Colors.white)),
                    controller: controller.goHomeButtonController,
                    onPressed: () {
                      // final thenTo = Get.rootDelegate.currentConfiguration!
                      //     .currentPage!.parameters?['then'];
                      // Get.rootDelegate.offNamed(thenTo ?? Routes.HOME);
                      Get.rootDelegate.toNamed(Routes.LOGIN);
                    },
                  ),
                ),
              ),
              SizedBox(height: MySize.safeHeight! * 0.015),
            ],
          ),
        ),
      ),
    );
  }
}
