import 'package:flutter/material.dart';

class TodoPopupCard extends StatelessWidget {
  final Widget item;
  final String tag;
  const TodoPopupCard({Key? key, required this.item, required this.tag})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return item;
  }
}
