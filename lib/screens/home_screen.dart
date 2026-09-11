import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/hero_stats_card.dart';
import '../widgets/quest_tile.dart';
import '../widgets/add_quest_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _level = 1;
  int _currentXp = 0;
  int _maxXp = 100;
  int _coins = 0;

  final List<Task> _quests = [
    Task(
      id: '1',
      title: 'Baca 1 Bab Tutorial Flutter',
      category: 'Coding',
      difficulty: 'Easy',
      xpReward: 25,
    ),
    Task(
      id: '2',
      title: 'Rapikan Meja Belajar',
      category: 'Rumah',
      difficulty: 'Medium',
      xpReward: 50,
    ),
    Task(
      id: '3',
      title: 'Latihan PR Matematika',
      category: 'Sekolah',
      difficulty: 'Hard',
      xpReward: 100,
    ),
  ];

  void _toggleQuest(int index) {
    setState(() {
      _quests[index].isCompleted = !_quests[index].isCompleted;

      if (_quests[index].isCompleted) {
        _currentXp += _quests[index].xpReward;
        _coins += 15;

        // Level Up Logic!
        if (_currentXp >= _maxXp) {
          _level++;
          _currentXp -= _maxXp;
          _maxXp += 50;
          _showLevelUpDialog();
        }
      } else {
        _currentXp = (_currentXp - _quests[index].xpReward).clamp(0, 99999);
      }
    });
  }

  void _addQuest(String title, String category, String difficulty, int xp) {
    setState(() {
      _quests.add(
        Task(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          category: category,
          difficulty: difficulty,
          xpReward: xp,
        ),
      );
    });
  }

  void _deleteQuest(int index) {
    setState(() {
      _quests.removeAt(index);
    });
  }

  void _showLevelUpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A1B54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Center(
          child: Text(
            '🎉 LEVEL UP! 🎉',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🏆', style: TextStyle(fontSize: 55)),
            const SizedBox(height: 10),
            Text(
              'Selamat! Pahlawanmu telah mencapai Level $_level!',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C4DFF),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Lanjutkan Petualangan! ⚔️',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int completedCount = _quests.where((q) => q.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E38),
        title: const Row(
          children: [
            Icon(Icons.sports_esports, color: Color(0xFF7C4DFF), size: 28),
            SizedBox(width: 10),
            Text(
              'QuestLog RPG',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroStatsCard(
            level: _level,
            currentXp: _currentXp,
            maxXp: _maxXp,
            coins: _coins,
            completedQuests: completedCount,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
            child: Text(
              'Daftar Misi Harian 🎯',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _quests.length,
              itemBuilder: (context, index) {
                return QuestTile(
                  task: _quests[index],
                  onChanged: (val) => _toggleQuest(index),
                  onDelete: () => _deleteQuest(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF7C4DFF),
        icon: const Icon(Icons.add_task, color: Colors.white),
        label: const Text(
          'Quest Baru',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddQuestDialog(onAdd: _addQuest),
          );
        },
      ),
    );
  }
}
