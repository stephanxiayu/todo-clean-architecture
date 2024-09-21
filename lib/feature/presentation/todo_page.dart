import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_clean/feature/domain/repository/todo_repository.dart';
import 'package:to_do_clean/feature/presentation/todo_view.dart';

import 'todo_cubit.dart';

class TodoPage extends StatelessWidget {
  final ToDoRepository toDoRepository;

  const TodoPage({super.key, required this.toDoRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(toDoRepository),
      child: const TodoView(),
    );
  }
}
