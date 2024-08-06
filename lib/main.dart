import 'package:app_test/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My tasks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          surfaceTint: Colors.transparent,
        ),
        appBarTheme: AppBarTheme(
          elevation: 4.0,
          shadowColor: Theme.of(context).colorScheme.shadow,
        ),
      ),
      home: const TasksScreen(title: 'Minhas tarefas'),
    );
  }
}
