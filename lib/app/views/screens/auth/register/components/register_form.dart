import 'package:beep_mobile/app/controllers/register.dart';
import 'package:beep_mobile/app/views/components/language_action_btn.dart';
import 'package:beep_mobile/app/views/screens/auth/register/components/background.dart';
import 'package:beep_mobile/utils/SizeConfig.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

// import 'package:get/get_state_manager/src/simple/get_view.dart';

class RegisterForm extends GetView<RegisterController> {
  const RegisterForm({Key? key}) : super(key: key);
  _pickDate(BuildContext context) async {
    await showDatePicker(
            fieldLabelText: "mm/dd/yyyy",
            fieldHintText: "mm/dd/yyyy",
            context: context,
            helpText: LocaleKeys.label_birthdate.tr,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900, 1),
            lastDate: DateTime.now())
        .then((value) {
      controller.changeBirthDate(value!);
      // Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            controller.changePage();
          },
          child: Icon(
            Get.locale.toString() == "ar"
                ? MdiIcons.chevronRight
                : MdiIcons.chevronLeft,
          ),
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
              Image.asset(
                "assets/images/img4.png",
                height: MySize.safeHeight! * 0.28,
              ),
              SizedBox(height: MySize.safeHeight! * 0.03),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  LocaleKeys.label_inscription.tr,
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
                padding: EdgeInsets.symmetric(horizontal: MySize.size24!),
                child: Text(
                  LocaleKeys.label_complete_info.tr,
                  textAlign: TextAlign.center,
                  style: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                      letterSpacing: 0,
                      fontWeight: 500,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground),
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
                  keyboardType: TextInputType.number,
                  controller: controller.userNameController,
                  style: AppTheme.getTextStyle(
                    AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                    letterSpacing: 0,
                    height: 2,
                    fontWeight: 500,
                    color: const Color(0xff495057),
                  ),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.label_social_security_number.tr,
                    hintStyle: AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                        color: const Color(0xff495057),
                        letterSpacing: 0,
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
                      MdiIcons.cardAccountDetails,
                      size: MySize.size28,
                      color:
                          AppTheme.getThemeFromThemeMode().colorScheme.primary,
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
                  textInputAction: TextInputAction.next,
                  textAlignVertical: TextAlignVertical.center,
                  controller: controller.lastNameController,
                  style: AppTheme.getTextStyle(
                    AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                    letterSpacing: 0,
                    height: 2,
                    fontWeight: 500,
                    color: const Color(0xff495057),
                  ),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.label_lastname.tr,
                    hintStyle: AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
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
                      size: MySize.size28,
                      color:
                          AppTheme.getThemeFromThemeMode().colorScheme.primary,
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
                  textInputAction: TextInputAction.next,
                  textAlignVertical: TextAlignVertical.center,
                  controller: controller.firstNameController,
                  style: AppTheme.getTextStyle(
                    AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                    letterSpacing: 0,
                    height: 2,
                    fontWeight: 500,
                    color: const Color(0xff495057),
                  ),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.label_firstname.tr,
                    hintStyle: AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
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
                      size: MySize.size28,
                      color:
                          AppTheme.getThemeFromThemeMode().colorScheme.primary,
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
                  textInputAction: TextInputAction.done,
                  readOnly: true,
                  onTap: () => _pickDate(context),
                  textAlignVertical: TextAlignVertical.center,
                  controller: controller.birthDateController,
                  style: AppTheme.getTextStyle(
                    AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
                    letterSpacing: 0,
                    height: 2,
                    fontWeight: 500,
                    color: const Color(0xff495057),
                  ),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.label_birthdate.tr,
                    hintStyle: AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.bodyText2,
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
                      MdiIcons.calendar,
                      size: MySize.size28,
                      color:
                          AppTheme.getThemeFromThemeMode().colorScheme.primary,
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.only(right: 16),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: ToggleSwitch(
                  customTextStyles: [
                    AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.caption,
                        letterSpacing: 0,
                        color: Colors.black,
                        // color: Colors.white,
                        fontWeight: 700),
                    AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.caption,
                        color: Colors.black,
                        letterSpacing: 0,
                        fontWeight: 700)
                  ],
                  minWidth: MySize.safeWidth! * 0.35,
                  initialLabelIndex: 0,
                  cornerRadius: 20.0,
                  // activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey.withOpacity(0.6),
                  // inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  radiusStyle: true,
                  labels: [
                    LocaleKeys.labe_non_presume.tr,
                    LocaleKeys.label_presume.tr,
                  ],
                  activeBgColor: const [
                    Color(0xffc5def2),
                  ],
                  onToggle: (index) {
                    controller.changePresume(index!);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                width: MySize.safeWidth! * 0.4,
                height: MySize.size56,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: RoundedLoadingButton(
                    color: AppTheme.getThemeFromThemeMode().primaryColor,
                    child: Text(LocaleKeys.label_continue.tr,
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .subtitle2,
                            color: Colors.white)),
                    controller: controller.registerButtonController,
                    onPressed: () => controller.register(),
                  ),
                ),
              ),
              SizedBox(height: MySize.safeHeight! * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => {
                      controller.showTermsDialog(),
                    },
                    child: SizedBox(
                      width: MySize.safeWidth! * 0.7,
                      child: Text(LocaleKeys.label_agree_terms.tr,
                          textAlign: TextAlign.center,
                          style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .subtitle2,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .primary,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
