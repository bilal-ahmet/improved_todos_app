import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_app_riverpod/models/todo_model.dart';
import 'package:todos_app_riverpod/provider/all_providers.dart';
import 'package:todos_app_riverpod/provider/todos_list_manager.dart';
import 'package:todos_app_riverpod/widgets/title_widget.dart';
import 'package:todos_app_riverpod/widgets/todo_list_item_widget.dart';
import 'package:todos_app_riverpod/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});
  final newTodoController = TextEditingController();

  /*
  // todoModel'de oluşturduğumuz verileri for döngüsü ile gezmek için kullanacağız. TodoListManager'da StateNotifier kullandığımız
  // için bu bölüme gerek kalmadı bundan sonra state management vaktidir.
  final List<TodoModel> _allTodos = [
    TodoModel(id: const Uuid().v4(), description: "spora git"),
    TodoModel(id: const Uuid().v4(), description: "alışveriş yap"),
    TodoModel(id: const Uuid().v4(), description: "yemek hazırla"),
  ];
  */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(filtredTodoList);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(
          children: [
            const TitleWidget(),
            TextField(
              // text field'a yazılan verileri almak için controller yazmamız gerekli, texteditingcontroller ile alacağız

              decoration:
                  const InputDecoration(hintText: "bugün neler yapacaksın ?"),
              controller: newTodoController,
              onSubmitted: (newtodo) {
                ref.read(todoListProvider.notifier).addTodo(newtodo);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ToolBarWidget(),
            allTodos.isEmpty ? const Center(child: Text("bu koşullarda görev yok")) : const SizedBox(),
            for (int i = 0; i < allTodos.length; i++)
              Dismissible(
                  key: ValueKey(allTodos[i].id),

                  onDismissed: (_) {
                    ref.read(todoListProvider.notifier).remove(allTodos[i]);
                  },

                  // ProviderScop, bütün providerlara eriş anlamına gelmektedir.
                  child: ProviderScope(
                    overrides: [
                      currentTodo.overrideWithValue(allTodos[i])
                    ],
                    child: const TodoListItemWidget()),
                  
                ),
          ],
        ),
      ),
    );
  }
}
