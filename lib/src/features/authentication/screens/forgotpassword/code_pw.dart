import 'package:english_learning/src/features/authentication/screens/forgotpassword/new_pw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/theme/widget_themes/button_theme.dart';

class CodeOTP extends StatefulWidget {
  @override
  _CodeOTPState createState() => _CodeOTPState();
}

class _CodeOTPState extends State<CodeOTP> {

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
                const SizedBox(height: tFormHeight,),
                const Text(tCodeSubTitle,
                 style: TextStyle(fontSize: tFontSizeSubTitle,),
              ),
                const SizedBox(height: tFormHeight,),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                ),

                SizedBox(height: 50.0),
                buildCustomButton(
                text: tButtoncode,
                onPressed: () {
                // Chuyển đến trang Newpw
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Newpw()),
                );
                },
                backgroundColor: tBackgroundButtonColor,
                textColor: tTextButtonColor,
                ),
                  ],
              ),),
          ),
        ),
    );
  }
}

