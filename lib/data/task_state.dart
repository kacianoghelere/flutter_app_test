import 'package:app_test/models/task.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class TaskState extends InheritedWidget {
  final List<Task> taskList;
  final Function(Task) addTask;
  final Function(Task, Task) updateTask;
  final Function(Task) removeTask;

  const TaskState({
    super.key,
    required super.child,
    required this.taskList,
    required this.addTask,
    required this.updateTask,
    required this.removeTask
  });

  static TaskState of(BuildContext context) {
    final TaskState? result = context.dependOnInheritedWidgetOfExactType<TaskState>();

    assert(result != null, 'TaskState not  found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(TaskState oldWidget) {
    return oldWidget.taskList.equals(taskList) == false;
  }
}

class TaskProvider extends StatefulWidget {
  const TaskProvider({super.key, required this.child});

  final Widget child;

  @override
  State<TaskProvider> createState() => _TaskProviderState();
}

class _TaskProviderState extends State<TaskProvider> {
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
      child: widget.child
    );
  }
}
