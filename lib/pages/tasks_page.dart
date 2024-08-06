import 'package:app_test/components/task/task_form.dart';
import 'package:app_test/components/task/tasks_list.dart';
import 'package:app_test/enums/task_enums.dart';
import 'package:app_test/events/task_update_event.dart';
import 'package:app_test/models/task.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  final String title;

  const TasksPage({super.key, required this.title});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<Task> _tasks = [];

  void _onChangeTask(TaskUpdateEvent event) {
    setState(() {
      Task task = _tasks.firstWhere((task) => task.id == event.task.id);

      switch (event.type) {
        case TaskUpdateEventType.downgrade:
          if (task.level > 0) task.level -= 1;
        case TaskUpdateEventType.upgrade:
          if (task.level < 10) task.level += 1;
        case TaskUpdateEventType.remove:
          _tasks.remove(task);
        default:
          return;
      }
    });
  }

  void _closeDialog() {
    Navigator.pop(context);
  }

  void _onSubmit(Task task) {
    setState(() => _tasks.add(task));

    _closeDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: TaskList(tasks: _tasks, onChanged: _onChangeTask),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _addTask,
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TaskForm(
                onSubmit: _onSubmit,
                onCancel: _closeDialog
              )
            ),
          ),
        ),
        tooltip: 'Adicionar tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }
}