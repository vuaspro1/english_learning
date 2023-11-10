import 'package:english_learning/src/features/authentication/screens/test/utils/const.dart';
import 'package:flutter/material.dart';
class ButtonCustom extends StatelessWidget {
  String title;
  Function onTap;
  ButtonCustom ({super.key, required this.title, required this.onTap});
  @override
  Widget build (BuildContext context){
    return  Material(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.amber,
        onTap: () => onTap(),
        child: Ink(
            padding: EdgeInsets.symmetric(vertical: getHeight(context)*0.02),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff6CEEBF),
                  Color(0xff6CEEAF),
                ],
              ),
            ),
            width: getWidth(context),
            child: Align(
              child: Text(title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ) ,),
            )
        ),
      ),
    );
  }
}
