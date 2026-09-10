import 'package:flutter/material.dart';
import '../models/task_model.dart';

class QuestTile extends StatelessWidget {
  final Task task;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;

  const QuestTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
  });

  Color _getDifficultyColor() {
    switch (task.difficulty) {
      case 'Easy':
        return const Color(0xFF00E676);
      case 'Medium':
        return Colors.orangeAccent;
      case 'Hard':
        return const Color(0xFFFF5252);
      default:
        return Colors.blueAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: task.isCompleted
            ? const Color(0xFF191932)
            : const Color(0xFF222244),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: task.isCompleted
              ? Colors.white10
              : const Color(0xFF7C4DFF).withOpacity(0.3),
        ),
      ),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          activeColor: const Color(0xFF00E676),
          checkColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          onChanged: onChanged,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            color: task.isCompleted ? Colors.white38 : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _getDifficultyColor().withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                task.difficulty,
                style: TextStyle(
                  color: _getDifficultyColor(),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '• ${task.category}',
              style: const TextStyle(color: Colors.white38, fontSize: 11),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '+${task.xpReward} XP',
                style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.white30,
                size: 20,
              ),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
