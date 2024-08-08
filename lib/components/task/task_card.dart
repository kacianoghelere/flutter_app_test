import 'package:app_test/components/commons/Conditional.dart';
import 'package:app_test/components/task/task_difficulty.dart';
import 'package:app_test/data/task_state.dart';
import 'package:app_test/models/task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Task _changeTask(Task oldTask, int progress) {
    oldTask.progress += progress;

    return oldTask;
  }

  @override
  Widget build(BuildContext context) {
    final taskState = TaskState.of(context);

    return Card(
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          child: Conditional(
            condition: widget.task.progress >= 10,
            then: const Icon(Icons.check),
            otherwise: CircularProgressIndicator(value: widget.task.progress / 10)
          ),
        ),
        subtitle: TaskDifficulty(task: widget.task),
        title: Text(
          widget.task.name,
          style: const TextStyle(
            fontSize: 24,
            overflow: TextOverflow.ellipsis
          ),
        ),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              enabled: (widget.task.progress < 10),
              onTap: () {
                taskState.updateTask(_changeTask(widget.task, 1));
              },
              child: const ListTile(
                leading: Icon(Icons.arrow_upward),
                title: Text('Subir nível'),
              ),
            ),
            PopupMenuItem(
              enabled: (widget.task.progress > 0),
              onTap: () {
                taskState.updateTask(_changeTask(widget.task, -1));
              },
              child: const ListTile(
                leading: Icon(Icons.arrow_downward),
                title: Text('Reduzir nível'),
              ),
            ),
            PopupMenuItem(
              onTap: () {
                taskState.removeTask(widget.task);
              },
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text('Remover'),
              ),
            ),
          ]
        ),
      )
    );
  }
}
