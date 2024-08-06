import 'package:app_test/components/task/task_card.dart';
import 'package:app_test/data/task_state.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskState = TaskState.of(context);

    if (taskState.taskList.isEmpty) {
      return const Text('Nenhuma tarefa adicionada');
    }

    return ListView.builder(
      itemCount: taskState.taskList.length,
      itemBuilder: (context, index) {
        final task = taskState.taskList[index];

        return TaskCard(task: task);
      },
    );
  }
}