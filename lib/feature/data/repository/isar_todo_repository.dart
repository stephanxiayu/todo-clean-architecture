import 'package:isar/isar.dart';
import 'package:to_do_clean/feature/data/models/isar_todo_model.dart';
import 'package:to_do_clean/feature/domain/models/todo_models.dart';
import 'package:to_do_clean/feature/domain/repository/todo_repository.dart';

class IsarTodoRepository implements ToDoRepository {
  // database
  final Isar db;

  IsarTodoRepository(this.db);

  // get todos
  @override
  Future<List<ToDoModel>> getTodos() async {
    // fetch from db
    final todos = await db.todoIsars.where().findAll();

    // return as a list of todos and give to domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  // add todo
  @override
  Future<void> addTodo(ToDoModel newTodo) async {
    // convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(newTodo);

    // so that we can store it in our isar db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  // update todo
  @override
  Future<void> updateTodo(ToDoModel updateTodo) {
    // convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(updateTodo);

    // so that we can store it in our isar db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  // delete todo
  @override
  Future<void> deleteTodo(ToDoModel deleteTodo) async {
    await db.writeTxn(() => db.todoIsars.delete(deleteTodo.id));
  }
}
