import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_app_riverpod/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoListManager extends StateNotifier<List<TodoModel>> {
  // liste initialTodos diye bir değişkenle başlasın - eğer başlamazsa boş bir liste ile başlasın
  TodoListManager([List<TodoModel>? initialTodos]) : super(initialTodos ?? []);

  void addTodo(String description) {
    var eklenecekTodo =
        TodoModel(id: const Uuid().v4(), description: description);

    // bu gösterim state'de bulunan önceki verileri koru üstüne gelecek yeni verileri ekle anlamına gelmektedir.
    state = [...state, eklenecekTodo];
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              description: todo.description,
              completed: !todo.completed)
        else
          todo
    ];
  }

  void edit({required String id, required String newDescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              description: newDescription,
              completed: todo.completed)
        else
          todo
    ];
  }


  void remove(TodoModel silinecekTodo){

    // silinecekTodo adı ile belirlenen yere bir veri gelidği zaman mevcut listeyi tek tek where fonksiyonu ile gezip eğer id'si uymazsa
    // yeni listeye ekliyor ama id'si eşitse onu dahil etmiyor.
    // id'si aynı olmayanları yeni oluşan listeye yolla demek bu, id'si aynı olanları alma diyor.
    state = state.where((element) => element.id != silinecekTodo.id).toList();
  }


  int onCompletedTodoCount(){
    return state.where((element) => !element.completed).length;
  }
}
