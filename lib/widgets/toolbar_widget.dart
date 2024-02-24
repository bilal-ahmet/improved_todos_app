import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_app_riverpod/provider/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  ToolBarWidget({super.key});
  var _currentFilter = TodoListFilter.all;

  Color changeTextColor(TodoListFilter filt){
    return _currentFilter == filt ? Colors.orange : Colors.teal;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    /* int onCompletedTodoCount = ref
        .watch(todoListProvider)
        .where((element) => !element.completed)
        .length; */       // bu kodlar yerine riverpod ile aşağıdaki gibi yazabiliyoruz.

    final onCompletedTodoCount = ref.watch(unCompletedTodoCount);

    _currentFilter = ref.watch(todoListFilter);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          onCompletedTodoCount == 0
              ? "bütün görevler tamamlandı"
              : "$onCompletedTodoCount görev tamamlanmadı",
          overflow: TextOverflow.ellipsis,
        )),
        Tooltip(
          message: "all todos",
          child: TextButton(style: TextButton.styleFrom(foregroundColor: changeTextColor(TodoListFilter.all)), onPressed: () {
            ref.read(todoListFilter.notifier).state = TodoListFilter.all;
          }, child: const Text("All")),
        ),
        Tooltip(
          message: "Active",
          child: TextButton(style: TextButton.styleFrom(foregroundColor: changeTextColor(TodoListFilter.active)),onPressed: () {
            ref.read(todoListFilter.notifier).state = TodoListFilter.active;
          }, child: const Text("Active")),
        ),
        Tooltip(
          message: "Completed",
          child: TextButton(style: TextButton.styleFrom(foregroundColor: changeTextColor(TodoListFilter.completed)),onPressed: () {
            ref.read(todoListFilter.notifier).state = TodoListFilter.completed;
          }, child: const Text("Completed")),
        ),
      ],
    );
  }
}
