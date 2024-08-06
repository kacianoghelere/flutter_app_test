import 'package:app_test/components/task/task_form.dart';
import 'package:app_test/components/task/tasks_list.dart';
import 'package:app_test/enums/task_enums.dart';
import 'package:app_test/events/task_update_event.dart';
import 'package:app_test/models/task.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  final String title;

  const TasksScreen({super.key, required this.title});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Task> _tasks = [];

  void _onChangeTask(TaskUpdateEvent event) {
    setState(() {
      Task task = _tasks.firstWhere((task) => task.id == event.task.id);

      switch (event.type) {
        case TaskUpdateEventType.downgrade:
          if (task.level > 0) task.level -= 1;
          _displaySnackBar('Tarefa atualizada');
        case TaskUpdateEventType.upgrade:
          if (task.level < 10) task.level += 1;
          _displaySnackBar('Tarefa atualizada');
        case TaskUpdateEventType.remove:
          _tasks.remove(task);
          _displaySnackBar('Tarefa removida');
        default:
          return;
      }
    });
  }

  void _closeDialog() {
    Navigator.pop(context);
  }

  void _displaySnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  void _onSubmit(Task task) {
    setState(() => _tasks.add(task));

    _displaySnackBar('Tarefa adicionada');

    _closeDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            child: const Text('Sobre'),
          ),
        ]
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: TaskList(
          tasks: _tasks,
          onChanged: _onChangeTask
        ),
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