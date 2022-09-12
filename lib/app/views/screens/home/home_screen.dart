// ignore_for_file: avoid_print

import 'package:beep_mobile/app/views/screens/root/drawer.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';

import 'package:beep_mobile/app/controllers/home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeForm extends GetView<HomeController> {
  const HomeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("info ${controller.user.noAssure}");

    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.dark.copyWith(
    //       statusBarColor: AppTheme.getThemeFromThemeMode().primaryColor),
    // );
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Center(
          child: Text(
            LocaleKeys.label_home.tr,
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              controller.goToScanner();
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => ScannerWidget(),
              // ));
            },
            icon: const Icon(
              Icons.add,
              size: 28,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
