// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:beep_mobile/app/views/components/cards/todo_item_tile_state.dart';

/// {@template todo_item_template}
/// An individual [Todo] [Item] with its [Checkbox].
/// {@endtemplate}
class TodoItemTile extends StatefulWidget {
  /// {@macro todo_item_template}
  const TodoItemTile({
    required this.item,
  });

  final Widget item;

  @override
  TodoItemTileState createState() => TodoItemTileState();
}
