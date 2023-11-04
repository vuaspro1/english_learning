import 'package:english_learning/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tBackGroundColor,
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tBackground),
                fit: BoxFit.cover,
              ),
            ),
          )
        ),
      ),
    );
  }
}
