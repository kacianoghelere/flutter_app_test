import 'package:app_test/enums/task_enums.dart';
import 'package:app_test/models/task.dart';

class TaskUpdateEvent {
  final Task task;
  final TaskUpdateEventType type;

  TaskUpdateEvent({required this.task, required this.type});
}