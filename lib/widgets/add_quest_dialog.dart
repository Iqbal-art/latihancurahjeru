import 'package:flutter/material.dart';

/// Dialog Interaktif untuk Menambah Misi Baru (Quest Baru)
class AddQuestDialog extends StatefulWidget {
  final Function(String title, String category, String difficulty, int xp)
  onAdd;

  const AddQuestDialog({super.key, required this.onAdd});

  @override
  State<AddQuestDialog> createState() => _AddQuestDialogState();
}

class _AddQuestDialogState extends State<AddQuestDialog> {
  final _titleController = TextEditingController();
  String _selectedDifficulty = 'Easy';
  final String _selectedCategory = 'Sekolah';

  final Map<String, int> _xpRewardMap = {'Easy': 25, 'Medium': 50, 'Hard': 100};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF1E1E38),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Row(
        children: [
          Text('📜 ', style: TextStyle(fontSize: 20)),
          Text(
            'Tambah Quest Baru',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nama Misi:',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Contoh: Belajar Flutter Sesi 2',
                hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
                filled: true,
                fillColor: const Color(0xFF12122B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Tingkat Kesulitan & XP:',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Easy', 'Medium', 'Hard'].map((diff) {
                bool isSelected = _selectedDifficulty == diff;
                return ChoiceChip(
                  label: Text('$diff (+${_xpRewardMap[diff]}XP)'),
                  selected: isSelected,
                  selectedColor: const Color(0xFF7C4DFF),
                  backgroundColor: const Color(0xFF12122B),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.white60,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedDifficulty = diff;
                      });
                    }
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal', style: TextStyle(color: Colors.white54)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00E676),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            if (_titleController.text.trim().isNotEmpty) {
              widget.onAdd(
                _titleController.text.trim(),
                _selectedCategory,
                _selectedDifficulty,
                _xpRewardMap[_selectedDifficulty]!,
              );
              Navigator.pop(context);
            }
          },
          child: const Text(
            'Terima Quest!',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
