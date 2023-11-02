import 'package:english_learning/src/features/authentication/screens/profile/profile.dart';
import 'package:english_learning/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:english_learning/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:english_learning/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: ProfileScreen(),
    );
  }
}

