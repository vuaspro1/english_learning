import 'package:english_learning/src/features/authentication/screens/test/utils/const.dart';
import 'package:english_learning/src/features/authentication/screens/test/widgets/test_loading.dart';
import 'package:english_learning/src/features/authentication/screens/test/widgets/test_question.dart';
import 'package:flutter/material.dart';
import 'widgets/background_custom.dart';

class TakeTest extends StatefulWidget {
  const TakeTest( {super.key} );

  @override
  State<TakeTest> createState() => _TakeTestState();
}

class _TakeTestState extends State<TakeTest> {

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
      body: Stack(
        children: [
          const BackgroundCustom(),
          Positioned.fill(
              child: SafeArea(
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: getWidth(context)*0.03,
                      vertical: getHeight(context)*0.02
                  ),
                  child: SingleChildScrollView(
                    child: Column (
                      children: [
                        SizedBox(height: getHeight(context)*0.06,),
                        const TestLoading(),
                        SizedBox(height: getHeight(context)*0.06,),
                        const QuestionBox(),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      )


    );

  }
}
