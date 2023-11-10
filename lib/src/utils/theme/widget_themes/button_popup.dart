import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

Widget buildCustomButtonPopUp({
  required String text,
  required VoidCallback onPressed,
  required Color backgroundColor,
  required Color textColor,
}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(tBorderRadiusCircular),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(100.0, 50.0)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: tFontTextButton,
          color: textColor,
        ),
      ),
    ),
  );
}
