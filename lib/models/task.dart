class Task {
  final String id;
  String name;
  int progress;
  int difficulty;

  Task({
    required this.id,
    required this.name,
    required this.difficulty,
    this.progress = 0
  });
}