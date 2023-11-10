import 'package:english_learning/src/features/authentication/screens/test/utils/const.dart';
import 'package:flutter/material.dart';
class TestLoading extends StatelessWidget {
  const TestLoading ({super.key});
  @override
  Widget build (BuildContext context){
    return  Container(
      width: getWidth(context),
      height: getWidth(context)*0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          width: 5.6,
          color: Colors.white,
        )
      ),
      child: Stack(
        children: [
          Container(
            width: getWidth(context)*70/100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color (0xff39F4B1)
            ),
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: getHeight(context)*0.02 ),
              child:  RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(text: '70' ),
                        TextSpan(text: '%' )

                      ]
                  )
              )
          ),

        ],
      ),
    );
  }
}
