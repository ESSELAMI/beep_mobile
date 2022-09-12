// ignore_for_file: avoid_print

import 'package:beep_mobile/app/views/widgets/container/container.dart';

import 'package:beep_mobile/app/controllers/home.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeForm extends GetView<HomeController> {
  const HomeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("info ${controller.user.noAssure}");

    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.dark.copyWith(
    //       statusBarColor: AppTheme.getThemeFromThemeMode().primaryColor),
    // );
    return controller.obx(
      (state) => Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          // color: customTheme.card,
          shape: const CircularNotchedRectangle(),
          child: FxContainer(
            // color: customTheme.card,
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: TabBar(
              controller: controller.tabController,
              indicator: const BoxDecoration(),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor:
                  AppTheme.getThemeFromThemeMode().colorScheme.primary,
              tabs: <Widget>[
                Container(
                  child: (controller.currentIndex == 0)
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              MdiIcons.store,
                              size: 24,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .primary,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                                  color: AppTheme.getThemeFromThemeMode()
                                      .primaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2.5))),
                              height: 5,
                              width: 5,
                            )
                          ],
                        )
                      : Icon(
                          MdiIcons.storeOutline,
                          size: 24,
                          color: AppTheme.getThemeFromThemeMode()
                              .colorScheme
                              .onBackground,
                        ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                        // left: Language.autoDirection(0, 20)!,
                        // right: Language.autoDirection(20, 0)!,
                        ),
                    child: (controller.currentIndex == 1)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                MdiIcons.magnify,
                                size: 24,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .primary,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                    color: AppTheme.getThemeFromThemeMode()
                                        .primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(2.5))),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                        : Icon(
                            MdiIcons.magnify,
                            size: 24,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onBackground,
                          )),
                Container(
                    margin: const EdgeInsets.only(
                        // left: Language.autoDirection(20, 0)!,
                        // right: Language.autoDirection(0, 20)!,
                        ),
                    child: (controller.currentIndex == 2)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                MdiIcons.tag,
                                size: 24,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .primary,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                    color: AppTheme.getThemeFromThemeMode()
                                        .primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(2.5))),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                        : Icon(
                            MdiIcons.tagOutline,
                            size: 24,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onBackground,
                          )),
                Container(
                    child: (controller.currentIndex == 3)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                MdiIcons.account,
                                size: 24,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .primary,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                    color: AppTheme.getThemeFromThemeMode()
                                        .primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(2.5))),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                        : Icon(
                            MdiIcons.accountOutline,
                            size: 24,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onBackground,
                          )),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.goToScanner();
          },
          backgroundColor: AppTheme.getThemeFromThemeMode().backgroundColor,
          child: Icon(
            MdiIcons.qrcodeScan,
            color: AppTheme.getThemeFromThemeMode().colorScheme.primary,
            size: 24,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: TabBarView(
          controller: controller.tabController,
          children: <Widget>[
            Container(),
            Container(),
            Container(),
            Container(),
            // ShoppingHomeScreen(
            //   rootContext: context,
            // ),
            // ShoppingSearchScreen(
            //   rootContext: context,
            // ),
            // ShoppingSaleScreen(
            //   rootContext: context,
            // ),
            // ShoppingProfileScreen()
          ],
        ),
      ),
    );
  }
}
