import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_app_riverpod/provider/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int onCompletedTodoCount = ref
        .watch(todoListProvider)
        .where((element) => !element.completed)
        .length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          onCompletedTodoCount == 0
              ? "bütün görevler tamamlandı"
              : onCompletedTodoCount.toString() + " görev tamamlanmadı",
          overflow: TextOverflow.ellipsis,
        )),
        Tooltip(
          message: "all todos",
          child: TextButton(onPressed: () {}, child: const Text("All")),
        ),
        Tooltip(
          message: "Active",
          child: TextButton(onPressed: () {}, child: const Text("Active")),
        ),
        Tooltip(
          message: "Completed",
          child: TextButton(onPressed: () {}, child: const Text("Completed")),
        ),
      ],
    );
  }
}
