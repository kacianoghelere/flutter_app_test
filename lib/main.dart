import 'package:app_test/data/task_state.dart';
import 'package:app_test/examples/people_list.dart';
import 'package:app_test/models/task.dart';
import 'package:app_test/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  List<Task> _tasks = [];

  void _addTask(Task task) {
    setState(() {
      _tasks = List.from(_tasks)..add(task);
    });
  }

  void _updateTask(Task oldTask, Task newTask) {
    setState(() {
      int index = _tasks.indexOf(oldTask);

      if (index != -1) {
        _tasks[index] = newTask;
        _tasks = List.from(_tasks); // Create a new list
      }
    });
  }

  void _removeTask(Task task) {
    setState(() {
      _tasks = List.from(_tasks)..remove(task);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return TaskState(
      addTask: _addTask,
      removeTask: _removeTask,
      updateTask: _updateTask,
      taskList: _tasks,
      child: MaterialApp(
        title: 'My tasks',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple).copyWith(
            surfaceTint: Colors.transparent,
          ),
          appBarTheme: AppBarTheme(
            elevation: 4.0,
            shadowColor: Theme.of(context).colorScheme.shadow,
          )
        ),
        themeMode: ThemeMode.dark,
        initialRoute: '/',
        routes: {
          '/': (context) => const TasksScreen(),
          '/about': (context) => const AboutScreen()
        }
      ),
    );
  }
}
