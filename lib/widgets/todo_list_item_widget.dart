import 'package:flutter/material.dart';
import 'package:todos_app_riverpod/models/todo_model.dart';

class TodoListItemWidget extends StatelessWidget {
  TodoModel item;
  TodoListItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: true, onChanged: (value) {
        print(value);
      },),
      title: Text(item.description),
    );
  }
}