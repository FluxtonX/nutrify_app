import 'package:flutter/material.dart';

import '../features/splash/splash_screen.dart';
import 'theme/app_theme.dart';

class NutrifyApp extends StatelessWidget {
  const NutrifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrify',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
