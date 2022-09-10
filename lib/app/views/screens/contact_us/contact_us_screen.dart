import 'package:beep_mobile/app/controllers/contact_us.dart';
import 'package:beep_mobile/utils/SizeConfig.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ContactForm extends GetView<ContactController> {
  const ContactForm({Key? key}) : super(key: key);
  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size22!) / ((width / 2 - MySize.size22!) + 72);
  }

// Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          LocaleKeys.label_contact_us.tr,
          style: AppTheme.getTextStyle(
              AppTheme.getThemeFromThemeMode().textTheme.subtitle1,
              fontWeight: 600),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  Center(
                    child: Text(LocaleKeys.label_contact_us.tr,
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .bodyText1,
                            height: 2,
                            fontWeight: 600,
                            letterSpacing: 0)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MySize.size8!, horizontal: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(MdiIcons.home,
                            size: 24,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onBackground),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(LocaleKeys.label_cnas_address.tr,
                                    style: AppTheme.getTextStyle(
                                        AppTheme.getThemeFromThemeMode()
                                            .textTheme
                                            .bodyText1,
                                        height: 2,
                                        fontWeight: 600)),
                                // Text(
                                //     controller.user.noAssure
                                //         .toString(),
                                //     style: AppTheme.getTextStyle(
                                //         AppTheme.getThemeFromThemeMode()
                                //             .textTheme
                                //             .subtitle2,
                                //         fontWeight: 600))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.3,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MySize.size8!, horizontal: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(MdiIcons.email,
                            size: 24,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onBackground),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => controller.openEmail(
                                      "celluleecoutecommunication@cnas.dz"),
                                  child: Text(
                                      "celluleecoutecommunication@cnas.dz",
                                      style: AppTheme.getTextStyle(
                                          AppTheme.getThemeFromThemeMode()
                                              .textTheme
                                              .bodyText1,
                                          height: 2,
                                          fontWeight: 600)),
                                ),
                                // Text(
                                //     controller.user.frFullName
                                //         .toString(),
                                //     style: AppTheme.getTextStyle(
                                //         AppTheme.getThemeFromThemeMode()
                                //             .textTheme
                                //             .subtitle2,
                                //         fontWeight: 600))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.3,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(MdiIcons.earth,
                            size: 24,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onBackground),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      controller.openUrl("www.cnas.dz"),
                                  child: Text("www.cnas.dz",
                                      style: AppTheme.getTextStyle(
                                          AppTheme.getThemeFromThemeMode()
                                              .textTheme
                                              .bodyText1,
                                          height: 2,
                                          fontWeight: 600)),
                                ),
                                // Text(
                                //     controller.user.birthDate
                                //         .toString(),
                                //     style: AppTheme.getTextStyle(
                                //         AppTheme.getThemeFromThemeMode()
                                //             .textTheme
                                //             .subtitle2,
                                //         fontWeight: 600))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.3,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MySize.size8!, horizontal: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(MdiIcons.phone,
                            size: 24,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .onBackground),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => controller.makePhoneCall("3010"),
                                  child: Text(
                                      LocaleKeys.label_cnas_green_number.tr +
                                          " : 3010",
                                      style: AppTheme.getTextStyle(
                                          AppTheme.getThemeFromThemeMode()
                                              .textTheme
                                              .bodyText1,
                                          height: 2,
                                          fontWeight: 600)),
                                ),
                                // Text(
                                //     controller.user.address
                                //         .toString(),
                                //     style: AppTheme.getTextStyle(
                                //         AppTheme.getThemeFromThemeMode()
                                //             .textTheme
                                //             .subtitle2,
                                //         fontWeight: 600))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.3,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MySize.size8!, horizontal: 0),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () => controller.openUrl(
                                "https://www.facebook.com/cnasdirectiongenerale/?fref=ts"),
                            child: const Icon(MdiIcons.facebook,
                                size: 28, color: Color(0xff1198f5)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () => controller
                                .openUrl("https://twitter.com/CnasDirection"),
                            child: const Icon(MdiIcons.twitter,
                                size: 28, color: Color(0xff1d9bf0)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () => controller.openUrl(
                                "youtube.com/channel/UCIy6ieN-d8DpJsqhh-C7jvw"),
                            child: const Icon(MdiIcons.youtube,
                                size: 28, color: Color(0xffff0000)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.3,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Text(
                        "Ⓒ CNAS ALGERIA",
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .bodyText1,
                            color: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .primary,
                            fontWeight: 600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
