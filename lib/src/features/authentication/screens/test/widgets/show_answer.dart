import 'package:english_learning/src/features/authentication/screens/test/utils/const.dart';
import 'package:english_learning/src/features/authentication/screens/test/widgets/video_learning.dart';
import 'package:flutter/material.dart';


Future<void> showAnswer(context) => showModalBottomSheet(
    context: context,
    builder:(context) => FractionallySizedBox(
      heightFactor: 0.9,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: getWidth(context),
        color: const Color(0xFFE7E7E7),
        child: Expanded(
          child: Column(
            children: [
              const Text('Congratulations your answer is correct',
                  style: TextStyle(
                    color: Color(0xff2AD14E),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
              SizedBox(height: getHeight(context)*0.02),
              const Text('laugh',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              const Text('/laf/',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getHeight(context)*0.02),
              const Text('See more synonyms',
                style: TextStyle(
                  color: Color(0xffFF0F00),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getHeight(context)*0.02),
              Expanded(
                  child: VideoLearning(id:'vDWYpbYRHi0',) )
            ],
          ),
        ),
      ),

    )

);
