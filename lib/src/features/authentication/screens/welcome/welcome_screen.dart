import 'package:english_learning/src/constants/colors.dart';
import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:english_learning/src/features/authentication/screens/nav_bar/nav_bar_screen.dart';
import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../utils/theme/widget_themes/button_theme.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  void _loginButtonPressed(){
    if (_usernameController.text == tUserNameUser && _passwordController.text == tPasswordUser) {
      // If the username and password are "admin", navigate to the HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavBarScreen()),
      );
    } else {
      // If the username and password are incorrect, show an error dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: Icon(Icons.error,
              color: tErrorColor,
            ),
            title: const Text(tError),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the error dialog
                },
                child: const Text(tClose),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(tErrorColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(tBorderRadiusCircular), // Đặt bán kính cong
                    ),
                  ),
                  // minimumSize: MaterialStateProperty.all(Size(300.0, 50.0)),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void _signUpButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return SignUpScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tBackGroundColor,
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
              children: [
                 const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tLoginTitle,
                    style: TextStyle(
                      fontSize: tFontSizeTitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: tFormHeight,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tLoginSubTitle,
                    style: TextStyle(
                      fontSize: tFontSizeSubTitle,
                    ),
                  ),
                ),
                SizedBox(height: tFormHeight),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(tBorderRadiusCircular),
                    ),
                    labelText: tUserName,
                    filled: true,
                    fillColor: tTextFieldBackgroundColor,
                  ),
                ),
                SizedBox(height: tFormHeight),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(tBorderRadiusCircular),
                        ),
                        labelText: tPassword,
                        filled: true,
                        fillColor: tTextFieldBackgroundColor,
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
                SizedBox(height: tFormHeight),
                buildCustomButton(
                  text: tLoginTitle,
                  onPressed: _loginButtonPressed,
                  backgroundColor: tBackgroundButtonColor,
                  textColor: tTextButtonColor,
                ),
                SizedBox(height: tFormHeight-20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Xử lý khi liên kết "Forgot Password" được nhấn
                        },
                        child: const Text(
                          tForgetPassword,
                          style: TextStyle(
                            fontSize: tFontSizeSubTitle,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const Text(
                        tDontHaveAccount,
                        style: TextStyle(
                          fontSize: tFontSizeSubTitle,
                        ),
                      ),
                      SizedBox(height: tFormHeight-20),
                      TextButton(
                        onPressed: _signUpButtonPressed,
                        child: const Text(
                          tSignUp,
                          style: TextStyle(
                            fontSize: tDefaultSize,
                            color: tTextButtonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}