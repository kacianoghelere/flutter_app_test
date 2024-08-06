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
