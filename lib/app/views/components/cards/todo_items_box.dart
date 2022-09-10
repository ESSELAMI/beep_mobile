// ignore_for_file: use_key_in_widget_constructors

import 'package:beep_mobile/app/views/components/cards/todo_item_tile.dart';
import 'package:flutter/material.dart';

/// {@template todo_items_box}
/// Box containing the list of a [Todo]'s items.
///
/// These items can be checked.
/// {@endtemplate}
class TodoItemsBox extends StatelessWidget {
  /// {@macro todo_items_box}
  const TodoItemsBox({
    required this.item,
  });

  final Widget item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodoItemTile(item: item),
      ],
    );
  }
}
