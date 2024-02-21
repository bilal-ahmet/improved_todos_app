import 'package:flutter/material.dart';

class TodoListItemWidget extends StatelessWidget {
  const TodoListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: true, onChanged: (value) {
        print(value);
      },),
      title: Text("görev yap"),
    );
  }
}