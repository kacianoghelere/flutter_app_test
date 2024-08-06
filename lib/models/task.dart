class Task {
  final String id;
  String name;
  int level;
  int difficulty;

  Task({
    required this.id,
    required this.name,
    required this.difficulty,
    this.level = 0
  });
}