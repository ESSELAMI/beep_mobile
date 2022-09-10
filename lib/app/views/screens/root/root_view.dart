// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beep_mobile/app/controllers/root_controller.dart';
import 'package:beep_mobile/app/services/local/auth_service.dart';
import 'package:beep_mobile/app/views/screens/splash/splash_screen.dart';

import 'drawer.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        // final title = Obx(controller.initPage);
        return Scaffold(
            drawer:
                (AuthService.to.isLoggedInValue) ? const DrawerWidget() : null,
            body: controller.obx(
                (state) => GetRouterOutlet(
                      initialRoute: controller.initPage,
                      // anchorRoute: '/',
                      // filterPages: (afterAnchor) {
                      //   return afterAnchor.take(1);
                      // },
                    ),
                onLoading: SplashScreen()));
      },
    );
  }
}
