import 'package:app_test/models/task.dart';
import 'package:flutter/material.dart';

class TaskDifficulty extends StatelessWidget {
  final Task task;
  static int maxDifficulty = 5;

  const TaskDifficulty({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(TaskDifficulty.maxDifficulty, (index) => Icon(
        task.difficulty >= (index + 1) ? Icons.star : Icons.star_border,
        size: 15,
      ))
    );
  }
}