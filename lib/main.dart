import 'package:flutter/material.dart';
import 'package:latihancurahjeru/screens/home_screen.dart';

void main() {
  runApp(const QuestLogApp());
}

class QuestLogApp extends StatelessWidget {
  const QuestLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuestLog RPG',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF12122B),
        primaryColor: const Color(0xFF7C4DFF),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
