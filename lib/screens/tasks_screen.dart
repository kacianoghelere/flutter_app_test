import 'package:app_test/components/task/task_form.dart';
import 'package:app_test/components/task/tasks_list.dart';
import 'package:app_test/models/task.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key, this.title = 'Minhas tarefas'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
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
        child: const TaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext buttonContext) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TaskForm(
                onSubmit: (Task task) {
                  Navigator.pop(context);
                },
                onCancel: () {
                  Navigator.pop(context);
                }
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