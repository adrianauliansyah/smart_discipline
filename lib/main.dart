import 'package:flutter/material.dart';
import 'package:smart_discipline/screens/splash_screen.dart.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const SmartDisciplineApp());
}

class SmartDisciplineApp extends StatelessWidget {
  const SmartDisciplineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Discipline',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}