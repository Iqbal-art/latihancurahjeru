import 'package:flutter/material.dart';

void main() {
  runApp(const RPGApp());
}

class RPGApp extends StatelessWidget {
  const RPGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF1E1E2C), // Background Gelap Ala Game
        appBar: AppBar(
          title: const Text('RPG Daily Quests'),
          backgroundColor: const Color(0xFF2D2D44),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Menyusun elemen ke bawah
            children: [
              // --- 1. HEADER PROFIL ---
              const Icon(Icons.account_circle, size: 80, color: Colors.amber),
              const Text(
                'ShadowCoder',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              const Text(
                'Title: Lv. 1 Mage',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20), // Memberi Jarak
              // --- 2. STATS CARD ---
              Card(
                color: const Color(0xFF2D2D44),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Baris 1: Health / HP
                      Row(
                        // Menyusun elemen ke samping
                        children: const [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 10),
                          Text(
                            'HP: 80 / 100',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Baris 2: Energy / XP
                      Row(
                        children: const [
                          Icon(Icons.bolt, color: Colors.amber),
                          SizedBox(width: 10),
                          Text(
                            'XP: 40 / 100',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
