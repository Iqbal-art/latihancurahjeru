/// Model Data Misi / Quest
class Task {
  final String id;
  final String title;
  final String category; // 'Coding', 'Sekolah', 'Rumah'
  final String difficulty; // 'Easy', 'Medium', 'Hard'
  final int xpReward;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.difficulty,
    required this.xpReward,
    this.isCompleted = false,
  });
}
