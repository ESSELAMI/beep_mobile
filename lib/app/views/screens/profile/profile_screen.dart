import 'package:beep_mobile/app/controllers/profile.dart';
import 'package:beep_mobile/app/views/screens/profile/change_password/change_password_screen.dart';
import 'package:beep_mobile/app/views/screens/profile/change_phone/change_phone_screen.dart';
import 'package:beep_mobile/app/views/screens/profile/user_info/user_info_screen.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileWidget extends GetView<ProfileController> {
  // final _tabController = new TabController(length: 2, vsync: this);
  // _tabController!.animation!.addListener(() {
  //   final aniValue = _tabController!.animation!.value;
  //   if (aniValue - _currentIndex > 0.5) {
  //     setState(() {
  //       _currentIndex = _currentIndex + 1;
  //     });
  //   } else if (aniValue - _currentIndex < -0.5) {
  //     setState(() {
  //       _currentIndex = _currentIndex - 1;
  //     });
  //   }
  // });
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              controller.changePage();
              // Navigator.of(context).pop();
            },
            icon: Icon(
              Get.locale.toString() == "ar"
                  ? MdiIcons.chevronRight
                  : MdiIcons.chevronLeft,
            ),
          ),
          title: Text(
            LocaleKeys.label_profle.tr,
            style: AppTheme.getTextStyle(
                AppTheme.getThemeFromThemeMode().textTheme.subtitle1,
                fontWeight: 600),
          ),
          bottom: TabBar(
            onTap: (value) => controller.changeIndex(value),
            controller: controller.tabController,
            tabs: [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      MdiIcons.accountBox,
                      color: controller.currentIndex == 0
                          ? AppTheme.getThemeFromThemeMode().colorScheme.primary
                          : AppTheme.getThemeFromThemeMode()
                              .colorScheme
                              .onBackground,
                    ),
                    // Expanded(
                    //   child: Text(
                    //     LocaleKeys.label_change_password.tr,
                    //     style: AppTheme.getTextStyle(
                    //         AppTheme.getThemeFromThemeMode()
                    //             .textTheme
                    //             .bodyText1,
                    //         color: controller.currentIndex == 0
                    //             ? AppTheme.getThemeFromThemeMode()
                    //                 .colorScheme
                    //                 .primary
                    //             : AppTheme.getThemeFromThemeMode()
                    //                 .colorScheme
                    //                 .onBackground,
                    //         fontWeight: 600),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      MdiIcons.lock,
                      color: controller.currentIndex == 1
                          ? AppTheme.getThemeFromThemeMode().colorScheme.primary
                          : AppTheme.getThemeFromThemeMode()
                              .colorScheme
                              .onBackground,
                    ),
                    // Expanded(
                    //   child: Text(
                    //     LocaleKeys.label_change_password.tr,
                    //     style: AppTheme.getTextStyle(
                    //         AppTheme.getThemeFromThemeMode()
                    //             .textTheme
                    //             .bodyText1,
                    //         color: controller.currentIndex == 0
                    //             ? AppTheme.getThemeFromThemeMode()
                    //                 .colorScheme
                    //                 .primary
                    //             : AppTheme.getThemeFromThemeMode()
                    //                 .colorScheme
                    //                 .onBackground,
                    //         fontWeight: 600),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      MdiIcons.phone,
                      color: controller.currentIndex == 2
                          ? AppTheme.getThemeFromThemeMode().colorScheme.primary
                          : AppTheme.getThemeFromThemeMode()
                              .colorScheme
                              .onBackground,
                    ),
                    // Expanded(
                    //   child: Text(
                    //     LocaleKeys.label_change_password.tr,
                    //     style: AppTheme.getTextStyle(
                    //         AppTheme.getThemeFromThemeMode()
                    //             .textTheme
                    //             .bodyText1,
                    //         color: controller.currentIndex == 1
                    //             ? AppTheme.getThemeFromThemeMode()
                    //                 .colorScheme
                    //                 .primary
                    //             : AppTheme.getThemeFromThemeMode()
                    //                 .colorScheme
                    //                 .onBackground,
                    //         fontWeight: 600),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
            labelColor: AppTheme.getThemeFromThemeMode().colorScheme.primary,
            indicatorColor:
                AppTheme.getThemeFromThemeMode().colorScheme.primary,
            unselectedLabelColor:
                AppTheme.getThemeFromThemeMode().colorScheme.onBackground,
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: const <Widget>[
            UserInfoWidget(),
            ChangePasswordWidget(),
            ChangePhoneWidget(),
          ],
        )));
  }
}
