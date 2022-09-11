import 'package:beep_mobile/app/controllers/drawer.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/services/local/auth_service.dart';
import 'package:beep_mobile/app/services/local/theme_service.dart';
import 'package:beep_mobile/utils/SizeConfig.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DrawerWidget extends GetView<DrawerWidgetController> {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Drawer(
        child: controller.obx(
          (state) => Container(
            height: double.infinity,
            color: AppTheme.getCustomAppTheme().bgLayer1,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                        image: AssetImage("assets/images/beep_logo.png"),
                        height: 112,
                        width: 112,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .primaryContainer
                                .withAlpha(40),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text("${LocaleKeys.label_version.tr} : 1.0.0",
                            textAlign: TextAlign.center,
                            style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .caption,
                              fontSize: 13,
                              // height: 1.5,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .primary,
                              fontWeight: 900,
                            )),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  color: AppTheme.getCustomAppTheme().bgLayer1,
                  child: ListTile(
                    onTap: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) => {}
                      //         );
                    },
                    title: Text(
                      LocaleKeys.label_theme.tr,
                      style: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                          fontWeight: 600),
                    ),
                    trailing: SizedBox(
                      height: 47,
                      width: 57,
                      child: DayNightSwitcher(
                          isDarkModeEnabled:
                              ThemeService().theme == ThemeMode.dark,
                          onStateChanged: controller.onStateChanged),
                    ),
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  color: AppTheme.getCustomAppTheme().bgLayer1,
                  child: ExpansionTile(
                      key: UniqueKey(),
                      initiallyExpanded: false,
                      expandedCrossAxisAlignment: CrossAxisAlignment.center,
                      expandedAlignment: Alignment.center,
                      leading: const Icon(FontAwesomeIcons.language,
                          color: Colors.orangeAccent, size: 24),
                      title: Text(
                        controller.selectedLanguage,
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .subtitle2,
                            fontWeight: 600),
                        textAlign: TextAlign.center,
                      ),
                      children: <Widget>[
                        if (controller.selectedLanguage != "العربية")
                          ListTile(
                            onTap: () async {
                              controller.changeLang("العربية");
                            },
                            title: Text(
                              "العربية",
                              textAlign: TextAlign.center,
                              style: AppTheme.getTextStyle(
                                  AppTheme.getThemeFromThemeMode()
                                      .textTheme
                                      .subtitle2,
                                  fontWeight: 600),
                            ),
                          ),
                        if (controller.selectedLanguage != "English")
                          ListTile(
                            onTap: () async {
                              controller.changeLang("English");
                            },
                            title: Text(
                              "English",
                              textAlign: TextAlign.center,
                              style: AppTheme.getTextStyle(
                                  AppTheme.getThemeFromThemeMode()
                                      .textTheme
                                      .subtitle2,
                                  fontWeight: 600),
                            ),
                          ),
                        if (controller.selectedLanguage != "Français")
                          ListTile(
                            onTap: () async {
                              controller.changeLang("Français");
                            },
                            title: Text(
                              "Français",
                              textAlign: TextAlign.center,
                              style: AppTheme.getTextStyle(
                                  AppTheme.getThemeFromThemeMode()
                                      .textTheme
                                      .subtitle2,
                                  fontWeight: 600),
                            ),
                          ),
                      ]),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Get.rootDelegate.history.last.currentPage!.name
                                    .toString() ==
                                Routes.HOME ||
                            Get.rootDelegate.history.last.currentPage!.name
                                    .toString() ==
                                Routes.INITIAL
                        ? AppTheme.getThemeFromThemeMode().colorScheme.primary
                        : AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .onBackground,
                    size: 28,
                  ),
                  title: Text(LocaleKeys.label_home.tr,
                      style: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                          fontWeight: Get.rootDelegate.history.last.currentPage!
                                          .name
                                          .toString() ==
                                      Routes.HOME ||
                                  Get.rootDelegate.history.last.currentPage!.name.toString() ==
                                      Routes.INITIAL
                              ? 700
                              : 600,
                          color: Get.rootDelegate.history.last.currentPage!.name.toString() ==
                                      Routes.HOME ||
                                  Get.rootDelegate.history.last.currentPage!.name.toString() ==
                                      Routes.INITIAL
                              ? AppTheme.getThemeFromThemeMode().colorScheme.primary
                              : AppTheme.getThemeFromThemeMode().colorScheme.onBackground)),
                  onTap: () {
                    controller.changePage(0, Routes.HOME);

                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Get.rootDelegate.history.last.currentPage!.name
                                .toString() ==
                            Routes.PROFILE
                        ? AppTheme.getThemeFromThemeMode().colorScheme.primary
                        : AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .onBackground,
                    size: 28,
                  ),
                  title: Text(LocaleKeys.label_profle.tr,
                      style: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                          fontWeight: Get.rootDelegate.history.last.currentPage!
                                      .name
                                      .toString() ==
                                  Routes.PROFILE
                              ? 700
                              : 600,
                          color: Get.rootDelegate.history.last.currentPage!.name
                                      .toString() ==
                                  Routes.PROFILE
                              ? AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .primary
                              : AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground)),
                  onTap: () {
                    controller.changePage(0, Routes.PROFILE);

                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.view_list,
                    color: Get.rootDelegate.history.last.currentPage!.name
                                .toString() ==
                            Routes.FAMILYMEMBERS
                        ? AppTheme.getThemeFromThemeMode().colorScheme.primary
                        : AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .onBackground,
                    size: 22,
                  ),
                  title: Text('Products',
                      style: AppTheme.getTextStyle(
                          AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                          fontWeight: Get.rootDelegate.history.last.currentPage!
                                      .name
                                      .toString() ==
                                  Routes.FAMILYMEMBERS
                              ? 700
                              : 600,
                          color: Get.rootDelegate.history.last.currentPage!.name
                                      .toString() ==
                                  Routes.FAMILYMEMBERS
                              ? AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .primary
                              : AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground)),
                  onTap: () {
                    controller.changePage(0, Routes.FAMILYMEMBERS);

                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: MySize.size32!),
                Container(
                  margin: EdgeInsets.only(bottom: MySize.size50!),
                  child: Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppTheme.getThemeFromThemeMode().primaryColor),
                        ),
                        onPressed: () {
                          AuthService.to.logout();
                          // Get.rootDelegate.toNamed();
                          Get.rootDelegate.offNamed(Routes.LOGIN);
                          //to close the drawer
                          Navigator.of(context).pop();
                        },
                        child: Text(LocaleKeys.label_logout.tr)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
