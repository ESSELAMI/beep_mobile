import 'package:beep_mobile/app/controllers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeActionBtn extends GetView<ThemeController> {
  const ThemeActionBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButton(
        icon: const Icon(
          Icons.light,
          size: 24,
          color: Colors.white,
        ),
        underline: const SizedBox(),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          // ignore: prefer_const_constructors
          DropdownMenuItem(
            child: const Text(
              'light',
              textAlign: TextAlign.center,
            ),
            value: '1',
          ),
          // ignore: prefer_const_constructors
          DropdownMenuItem(
            child: const Text(
              'dark',
              style: TextStyle(
                fontFamily: 'kufi',
              ),
              textAlign: TextAlign.center,
            ),
            value: '2',
          ),
          // ignore: prefer_const_constructors
        ],

        onChanged: (value) {
          controller.changeTheme();
        },
      ),
    );
  }
}
