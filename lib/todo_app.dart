import 'package:flutter/material.dart';
import 'package:todos_app_riverpod/models/todo_model.dart';
import 'package:todos_app_riverpod/widgets/title_widget.dart';
import 'package:todos_app_riverpod/widgets/todo_list_item_widget.dart';
import 'package:todos_app_riverpod/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends StatelessWidget {
  TodoApp({super.key});
  final newTodoController = TextEditingController();

  // todoModel'de oluşturduğumuz verileri for döngüsü ile gezmek için kullanacağız
  final List<TodoModel> _allTodos = [
    TodoModel(id: Uuid().v4(), description: "spora git")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(
          children: [
            const TitleWidget(),
            TextField(
              // text field'a yazılan verileri almak için controller yazmamız gerekli, texteditingcontroller ile alacağız
        
              decoration: const InputDecoration(
                hintText: "bugün neler yapacaksın ?"
              ),
              controller: newTodoController,
              onSubmitted: (newtodo) {
                print("şunu ekle $newtodo");
              },
            ),
            
            const SizedBox(height: 20,),

            const ToolBarWidget(),

            const TodoListItemWidget()
          ],
        ),
      ),
    );
  }
}