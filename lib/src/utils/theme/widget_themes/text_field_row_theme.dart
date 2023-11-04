import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

Widget buildTextFieldRow(String label, String value) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    decoration: BoxDecoration(
      color: tTextFieldBackgroundColor,
      borderRadius: BorderRadius.circular(tBorderRadiusCircular),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 2),
          blurRadius: 4.0,
          spreadRadius: 0.0,
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Text(
            label,
            style: const TextStyle(
              color: tDarkColor,
              fontWeight: FontWeight.bold,
              fontSize: tFontSizeSubTitle,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Text(
            value,
            style: TextStyle(
              color: tDarkColor,
              fontWeight: FontWeight.bold,
              fontSize: tFontSizeSubTitle,
            ),
          ),
        ),
      ],
    ),
  );
}

