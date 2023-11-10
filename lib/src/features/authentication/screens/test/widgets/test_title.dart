import 'package:english_learning/src/features/authentication/screens/test/test_page.dart';
import 'package:flutter/material.dart';
class TestTitle extends StatelessWidget {
  final String title;
  const TestTitle ( this.title, {super.key});
  @override
  Widget build (BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const Learning()
                )
            );
            },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Expanded(
          child: Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
        ),
      ],
      
    );
  }
}
