import 'package:app_test/components/task/task_difficulty.dart';
import 'package:app_test/enums/task_enums.dart';
import 'package:app_test/events/task_update_event.dart';
import 'package:app_test/models/task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final ValueChanged<TaskUpdateEvent> onChanged;

  const TaskCard({super.key, required this.task, required this.onChanged});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircularProgressIndicator(value: widget.task.level / 10),
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
              enabled: (widget.task.level < 10),
              onTap: () {
                widget.onChanged(TaskUpdateEvent(
                  task: widget.task,
                  type: TaskUpdateEventType.upgrade
                ));
              },
              child: const ListTile(
                leading: Icon(Icons.arrow_upward),
                title: Text('Subir nível'),
              ),
            ),
            PopupMenuItem(
              enabled: (widget.task.level > 0),
              onTap: () {
                widget.onChanged(TaskUpdateEvent(
                  task: widget.task,
                  type: TaskUpdateEventType.downgrade
                ));
              },
              child: const ListTile(
                leading: Icon(Icons.arrow_downward),
                title: Text('Reduzir nível'),
              ),
            ),
            PopupMenuItem(
              onTap: () {
                widget.onChanged(TaskUpdateEvent(
                  task: widget.task,
                  type: TaskUpdateEventType.remove
                ));
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
