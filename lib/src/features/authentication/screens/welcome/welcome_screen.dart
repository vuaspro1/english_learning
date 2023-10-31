import 'package:english_learning/src/constants/colors.dart';
import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../signup/signup_screen.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _obscureText = true;
  void _loginButtonPressed(){

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
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
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
                Align(
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
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
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
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
                    child: Text("LOGIN",
                      style: TextStyle(fontSize: 20,
                      color: Colors.lightBlue),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue[100]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Đặt bán kính cong
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(300.0, 50.0)),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Xử lý khi liên kết "Forgot Password" được nhấn
                        },
                        child: Text(
                          tForgetPassword,
                          style: TextStyle(
                            fontSize: tFontSizeSubTitle,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Text(
                        tDontHaveAccount,
                        style: TextStyle(
                          fontSize: tFontSizeSubTitle,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextButton(
                        onPressed: _signUpButtonPressed,
                        child: Text(
                          tSignUp,
                          style: TextStyle(
                            fontSize: tFontSizeSubTitle + 10.0,
                            color: Colors.blue,
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