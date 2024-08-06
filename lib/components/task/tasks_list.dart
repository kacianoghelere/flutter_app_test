import 'package:app_test/components/task/task_card.dart';
import 'package:app_test/events/task_update_event.dart';
import 'package:app_test/models/task.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final ValueChanged<TaskUpdateEvent> onChanged;

  const TaskList({super.key, required this.tasks, required this.onChanged});

  List<TaskCard> _getCards() {
    return tasks.map((task) => (
      TaskCard(
        task: task,
        onChanged: onChanged
      )
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tasks.isNotEmpty ? _getCards() : <Widget>[
        const Text('Nenhuma tarefa adicionada')
      ]
    );
  }
}