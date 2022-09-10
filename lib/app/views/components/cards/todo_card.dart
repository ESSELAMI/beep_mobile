// ignore_for_file: overridden_fields, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beep_mobile/app/views/components/customWidgets/hero_dialog_route.dart';

// ignore: must_be_immutable
abstract class AppColors {
  /// Dark background color.
  static const Color backgroundColor = Color(0xFFef8354);

  /// Slightly lighter version of [backgroundColor].
  static const Color backgroundFadedColor = Color(0xFF191B1C);

  /// Color used for cards and surfaces.
  static const Color cardColor = Color(0xFFFFFFFF);

  /// Accent color used in the application.
  static const Color accentColor = Color(0xFFef8354);
}

class TodoCard extends GetView {
  final Widget item;

  @override
  final tag;
  final Widget? todoPopupCard;

  /// {@macro todo_card}
  const TodoCard(
      {Key? key, required this.item, required this.tag, this.todoPopupCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            HeroDialogRoute(
              builder: (context) => Center(
                child: todoPopupCard,
              ),
            ),
          );
        },
        child: item);
  }
}
