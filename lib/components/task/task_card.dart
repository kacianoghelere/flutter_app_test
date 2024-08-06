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
  @override
  Widget build(BuildContext context) {
    final taskState = TaskState.of(context);

    return Card(
      child: ListTile(
        leading: CircularProgressIndicator(value: widget.task.progress / 10),
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
                // taskState.updateTask(widget.task, widget.task.);
              },
              child: const ListTile(
                leading: Icon(Icons.arrow_upward),
                title: Text('Subir nível'),
              ),
            ),
            PopupMenuItem(
              enabled: (widget.task.progress > 0),
              onTap: () {
                // taskState.updateTask(widget.task.id, widget.task.progress - 10);
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
