import 'package:flutter/material.dart';

class TestContainer extends StatelessWidget {
  final String id;
  final String title;
  const TestContainer( this.id,this.title, {super.key});
  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(10),
        color: const Color (0xffD9D9D9),
      ),
      child: Align(
        child: Text(title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }

}