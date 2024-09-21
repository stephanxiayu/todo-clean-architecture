import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_clean/feature/domain/models/todo_models.dart';
import 'package:to_do_clean/feature/domain/repository/todo_repository.dart';

class TodoCubit extends Cubit<List<ToDoModel>> {
  final ToDoRepository toDoRepository;

  TodoCubit(this.toDoRepository) : super([]) {
    loadTodos();
  }

  // L O A D
  Future<void> loadTodos() async {
    // fetch list of todos from repo
    final todoList = await toDoRepository.getTodos();

    // emit the fetched list as the new state
    emit(todoList);
  }

  // A D D
  Future<void> addTodo(String text) async {
    // create a new todo with unique Id
    final newTodo = ToDoModel(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    // save the new todo to repo
    await toDoRepository.addTodo(newTodo);

    // re-load
    loadTodos();
  }

  // D E L E T E
  Future<void> deleteTodo(ToDoModel todo) async {
    // delete the provided todo from repo
    await toDoRepository.deleteTodo(todo);

    // re-load
    loadTodos();
  }

  // T O G G L E
  Future<void> toggleCompletion(ToDoModel todo) async {
    // toggle the completion status of provided todo
    final updatedTodo = todo.toogleCompletion();

    // update the todo in repo with new completion status
    await toDoRepository.updateTodo(updatedTodo);

    // re-load
    loadTodos();
  }
}
