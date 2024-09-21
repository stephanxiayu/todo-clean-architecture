import 'package:to_do_clean/feature/domain/models/todo_models.dart';

abstract class ToDoRepository {
// get list todo

  Future<List<ToDoModel>> getTodos();

// add new todo
  Future<void> addTodo(ToDoModel newTodo);
// update existing todo
  Future<void> updateTodo(ToDoModel updateTodo);
// delete todo
  Future<void> deleteTodo(ToDoModel deleteTodo);
}
