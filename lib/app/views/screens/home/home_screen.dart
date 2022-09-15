// ignore_for_file: avoid_print

import 'package:beep_mobile/app/controllers/home.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeForm extends GetView<HomeController> {
  const HomeForm({Key? key}) : super(key: key);
  dynamic tabItems() => <TabItem<IconData>>[
        const TabItem<IconData>(icon: FontAwesomeIcons.barcode),
        const TabItem<IconData>(icon: FontAwesomeIcons.clockRotateLeft),
        const TabItem<IconData>(icon: Icons.qr_code_scanner),
        const TabItem<IconData>(icon: FontAwesomeIcons.circleQuestion),
        const TabItem<IconData>(icon: FontAwesomeIcons.gear),
      ];
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.dark.copyWith(
    //       statusBarColor: AppTheme.getThemeFromThemeMode().primaryColor),
    // );
    return controller.obx(
      (state) => Scaffold(
        // ignore: avoid_dynamic_calls
        body: controller.pages()[controller.currentIndex],
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          color: Theme.of(context).unselectedWidgetColor,
          activeColor: Theme.of(context).colorScheme.primary,
          items: tabItems(),
          initialActiveIndex: controller.currentIndex,
          onTap: (int index) {
            controller.handleTabSelection(index);
          },
        ),
      ),
    );
  }
}
