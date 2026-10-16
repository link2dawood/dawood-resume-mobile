import 'package:flutter/material.dart';
import 'screens/resume_screen.dart';
import 'theme.dart';

void main() {
  runApp(const DawoodResumeApp());
}

class DawoodResumeApp extends StatelessWidget {
  const DawoodResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dawood Zafar – Resume',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const ResumeScreen(),
    );
  }
}
