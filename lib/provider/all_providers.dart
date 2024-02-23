
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_app_riverpod/models/todo_model.dart';
import 'package:todos_app_riverpod/provider/todos_list_manager.dart';
import 'package:uuid/uuid.dart';

final todoListProvider =  StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager(
    [
      TodoModel(id: const Uuid().v4(), description: "spora git"),
      TodoModel(id: const Uuid().v4(), description: "alışveriş yap"),
      TodoModel(id: const Uuid().v4(), description: "yemek yap ye"),
      TodoModel(id: const Uuid().v4(), description: "kitap oku"),
    ]
  );
});


final unCompletedTodoCount = Provider<int>((ref){
  final allTodo = ref.watch(todoListProvider);
  final count = allTodo.where((element) => !element.completed).length;
  return count;
});


final currentTodo = Provider<TodoModel>((ref){
  throw UnimplementedError();
});