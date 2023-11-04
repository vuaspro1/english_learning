import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../home/home.dart';
import '../profile/profile.dart';

class NavBarScreen extends StatefulWidget {
  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tBackGroundColor,
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          fixedColor: tTextButtonColor,
          unselectedItemColor: tSecondaryColor,
          iconSize: tIconSize,
          currentIndex: currentIndex,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: tHome),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: tProfile),
          ],
        ),
      ),
    );
  }
}
