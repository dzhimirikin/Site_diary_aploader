import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SiteDiaryApp());
}

class SiteDiaryApp extends StatelessWidget {
  const SiteDiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site Diary Uploader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
