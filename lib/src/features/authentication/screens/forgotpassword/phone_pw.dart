import 'package:english_learning/src/constants/text_strings.dart';
import 'package:english_learning/src/features/authentication/screens/forgotpassword/code_pw.dart';
import 'package:english_learning/src/utils/theme/widget_themes/button_theme.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../utils/theme/widget_themes/text_field_theme.dart';

class Phonepassword extends StatefulWidget {
  @override
  _PhonepasswordState createState() => _PhonepasswordState();
}

class _PhonepasswordState extends State<Phonepassword> {


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
            child:  Column(
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
              const Text( tEmailSubTitle,
                style: TextStyle(
                  fontSize: tFontSizeSubTitle,
              ),
              ),
              const SizedBox( height: 50, ),
                TextFormField(
                  decoration: TTextFormFieldTheme.inputDecoration(
                    labelText: tEmailpw,
                    prefixIcon: Icon(Icons.phone_android)
                  ),
                ),
              SizedBox(height: tFormHeight),
              buildCustomButton(
                text: tButtonphone,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CodeOTP()),
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
