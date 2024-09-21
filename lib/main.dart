import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_clean/feature/data/models/isar_todo_model.dart';
import 'package:to_do_clean/feature/data/repository/isar_todo_repository.dart';
import 'package:to_do_clean/feature/domain/repository/todo_repository.dart';
import 'package:to_do_clean/feature/presentation/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get directory path for storing data
  final dir = await getApplicationDocumentsDirectory();

  // open isar database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  // initialize the repo with isar database
  final isarTodoRepo = IsarTodoRepository(isar);

  // run app
  runApp(MyApp(todoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {
  // database injection through the app
  final ToDoRepository todoRepo;

  const MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: TodoPage(toDoRepository: todoRepo),
    );
  }
}
