import 'package:english_learning/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  static InputDecoration inputDecoration({
    String? labelText , // Giá trị mặc định cho labelText
    Icon? prefixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      prefixIcon: prefixIcon,
      labelStyle: TextStyle(color: tSecondaryColor),
      filled: true,
      fillColor: tTextFieldBackgroundColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: tSecondaryColor),
      ),
    );
  }
}