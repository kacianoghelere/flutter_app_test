import 'package:app_test/data/task_state.dart';
import 'package:app_test/examples/people_list.dart';
import 'package:app_test/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskProvider(
      child: MaterialApp(
        title: 'My tasks',
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple).copyWith(
            surfaceTint: Colors.transparent,
          ),
          appBarTheme: AppBarTheme(
            elevation: 4.0,
            shadowColor: Theme.of(context).colorScheme.shadow,
          )
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const TasksScreen(),
          '/about': (context) => const AboutScreen()
        }
      ),
    );
  }
}
