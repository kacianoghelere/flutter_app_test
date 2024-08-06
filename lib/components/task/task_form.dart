import 'package:app_test/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class TaskForm extends StatefulWidget {
  final ValueChanged<Task> onSubmit;
  final VoidCallback onCancel;

  const TaskForm({super.key, required this.onSubmit, required this.onCancel});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final difficultyController = TextEditingController();
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nome da tarefa'
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome da tarefa';
                }

                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Dificuldade da tarefa'),
                Slider(
                  value: _currentSliderValue,
                  max: 5,
                  min: 1,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var uuid = const Uuid();

                      widget.onSubmit(
                        Task(
                          id: uuid.v4(),
                          name: nameController.text,
                          difficulty: _currentSliderValue.toInt()
                        )
                      );
                    }
                  },
                  child: const Text('Adicionar tarefa'),
                ),
                FilledButton.tonal(
                  onPressed: widget.onCancel,
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}