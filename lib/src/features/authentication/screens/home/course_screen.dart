import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  String imglist;
  CourseScreen(this.imglist);
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
            widget.imglist,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
        ),
      ),
    );
  }
}
