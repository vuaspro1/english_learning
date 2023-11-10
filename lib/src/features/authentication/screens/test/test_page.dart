import 'package:english_learning/src/features/authentication/screens/test/take_test.dart';
import 'package:english_learning/src/features/authentication/screens/test/utils/const.dart';
import 'package:flutter/material.dart';
import 'widgets/background_custom.dart';
import 'package:english_learning/src/features/authentication/screens/test/models/test_category.dart';
import 'package:english_learning/src/features/authentication/screens/test/widgets/test_container.dart';


class Learning extends StatefulWidget {
  const Learning({super.key});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Test Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(

        child: Stack(
          children: [
            const BackgroundCustom(),
            GridView(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(context)*0.02,
                    vertical: getHeight(context)*0.02
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 23,
                    mainAxisSpacing: 23,
                    childAspectRatio: 2/1
                ),
                children: testData.map((item) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TakeTest() ,)
                    );
                  },
                  child: TestContainer(item.id, item.title),
                )).toList(),

        ),
    ],
      )
    ));
  }
}

const testData = [
  TestCategory('1', 'Test 1'),
  TestCategory('2', 'Test 2'),
  TestCategory('3', 'Test 3'),
  TestCategory('4', 'Test 4'),
  TestCategory('5', 'Test 5'),
  TestCategory('6', 'Test 6'),
  TestCategory('1', 'Test 7'),
  TestCategory('2', 'Test 8'),
  TestCategory('3', 'Test 9'),
  TestCategory('4', 'Test 10'),
  TestCategory('5', 'Test 11'),
  TestCategory('6', 'Test 12'),
  TestCategory('1', 'Test 13'),
  TestCategory('2', 'Test 14'),
  TestCategory('3', 'Test 15'),
  TestCategory('4', 'Test 16'),
  TestCategory('5', 'Test 17'),
  TestCategory('6', 'Test 18'),
  TestCategory('6', 'Test 19'),

];