import 'package:english_learning/src/constants/colors.dart';
import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';
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
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // If the username and password are incorrect, show an error dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(tError),
            content: Text(tErrorSubTitle),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the error dialog
                },
                child: Text(tClose),
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
    double textFieldWidth = MediaQuery.of(context).size.width - 40.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: tBackGroundColor,
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                )
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                Container(
                  width: textFieldWidth, // Đặt chiều rộng của Container bằng với TextField
                  child: ElevatedButton(
                    onPressed: _loginButtonPressed,
                    child:   Text(tLoginTitle,
                      style: TextStyle(fontSize: tDefaultSize,
                      color: tTextButtonColor),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(tBackgroundButtonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(tBorderRadiusCircular), // Đặt bán kính cong
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(300.0, 50.0)),
                    ),
                  ),
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