import 'package:beep_mobile/app/controllers/onboardin.dart';
import 'package:beep_mobile/app/views/components/language_action_btn.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardinghBody extends GetView<OnBoardingController> {
  const OnBoardinghBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final introKey = GlobalKey<IntroductionScreenState>();
    const bodyStyle = TextStyle(
      fontSize: 19.0,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        height: 1.2,
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: Color(0xFF0e8671),
      ),
      bodyTextStyle: bodyStyle,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 120,
        actions: const [LanguageActionBtn()],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: IntroductionScreen(
        key: key,
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
            title: LocaleKeys.label_introduction.tr,
            body: LocaleKeys.message_intro_one.tr,
            decoration: pageDecoration,
            image: controller.buildImage('logo.png'),
          ),
          // PageViewModel(
          //   title: LocaleKeys.label_consumption_history.tr,
          //   body: LocaleKeys.message_intro_three.tr,
          //   image: controller.buildImage('intro3.jpg'),
          //   decoration: pageDecoration,
          // ),
          PageViewModel(
            title: LocaleKeys.label_information.tr,
            body: LocaleKeys.message_intro_two.tr,
            image: controller.buildImage('intro1.jpg'),
            decoration: pageDecoration,
          ),
          // PageViewModel(
          //   title: LocaleKeys.label_virtual_chifa.tr,
          //   body: LocaleKeys.message_chifa_card_03.tr,
          //   image: controller.buildImage('img7.jpg'),
          //   decoration: pageDecoration,
          // ),
          // PageViewModel(
          //   title: LocaleKeys.label_notification.tr,
          //   body: LocaleKeys.message_intro_four.tr,
          //   image: controller.buildImage('intro2.jpg'),
          //   decoration: pageDecoration,
          // ),
          PageViewModel(
            title: LocaleKeys.label_languages.tr,
            body: LocaleKeys.label_language_support.tr,
            image: controller.buildImage('img6.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => controller.onIntroEnd(),
        onSkip: () =>
            controller.onIntroEnd(), // You can override onSkip callback
        showSkipButton: true,

        nextFlex: 0,
        //rtl: true, // Display as right-to-left
        skip: Text(
          LocaleKeys.label_skip_intro.tr,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Color(0xFF0e8671)),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Color(0xFF0e8671),
        ),
        done: Text(LocaleKeys.label_end_intro.tr,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Color(0xFF0e8671))),
        curve: Curves.fastOutSlowIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          activeColor: Color(0xFF0e8671),
          size: Size(10.0, 10.0),
          color: Color(0xFF0e8671),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
