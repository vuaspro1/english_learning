import 'package:english_learning/src/constants/text_strings.dart';
import 'package:english_learning/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:english_learning/src/utils/theme/widget_themes/button_popup.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../utils/theme/widget_themes/button_theme.dart';
import '../../../../utils/theme/widget_themes/text_field_theme.dart';

class Newpw extends StatefulWidget {
  @override
  _NewpwState createState() => _NewpwState();
}
class _NewpwState extends State<Newpw> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureConfirmpass = true;

  void _onSubmit() {
    if (_newPasswordController.text == _confirmPasswordController.text) {
      // Password và Confirm Password khớp nhau
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.check_circle,
              color: tCheckColor,
            ),
            title: const Text(tCheckpw),
            actions: [
              buildCustomButtonPopUp(
                text: tClose,
                onPressed: () {
                  Navigator.of(context).pop(); // Close the current dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                backgroundColor: tCheckColor,
                textColor: tTextFieldBackgroundColor,
              ),
            ],
          );
        },
      );
      // Additional logic after successful password confirmation can be added here
    } else {
      // Password và Confirm Password không khớp
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.error,
              color: tErrorColor,
            ),
            title: const Text(tErrorpw,
                style: TextStyle(color: tErrorColor)), // Add more details
            actions: [
              buildCustomButtonPopUp(
                text: tClose,
                onPressed: () {
                  Navigator.of(context).pop(); // Close the current dialog
                },
                backgroundColor: tErrorColor,
                textColor: tTextFieldBackgroundColor,
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // Sử dụng biểu tượng mũi tên quay lại
            onPressed: () {
              // Xử lý sự kiện khi người dùng nhấn biểu tượng
              // Điều hướng đến trang khác ở đây
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(tBackground),
                  fit: BoxFit.cover,
                )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tForgottitle,
                    style: TextStyle(
                      fontSize: tFontSizeTitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: tFormHeight,
                ),
                const Text(tNewpwSubtitle
                  , style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: _obscureText,
                      decoration: TTextFormFieldTheme.inputDecoration(
                        labelText: tPassword,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                    ),
                  ],
                ),
                const SizedBox(height: tFormHeight -10),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmpass,
                      decoration: TTextFormFieldTheme.inputDecoration(
                        labelText: tVerifyPassword,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureConfirmpass = !_obscureConfirmpass;
                        });
                      },
                      icon: Icon(_obscureConfirmpass ? Icons.visibility_off : Icons.visibility),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                buildCustomButton(
                  text: tButtoncode,
                  onPressed: _onSubmit ,
                  backgroundColor: tBackgroundButtonColor,
                  textColor: tTextButtonColor,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
