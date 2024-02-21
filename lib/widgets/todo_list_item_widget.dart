import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_app_riverpod/models/todo_model.dart';
import 'package:todos_app_riverpod/provider/all_providers.dart';

class TodoListItemWidget extends ConsumerWidget {
  TodoModel item;
  TodoListItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: item.completed,
        onChanged: (value) {
          ref.read(todoListProvider.notifier).toggle(item.id);
        },
      ),
      title: Text(item.description),
    );
  }
}
