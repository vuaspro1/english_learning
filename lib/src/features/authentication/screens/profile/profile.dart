import 'package:english_learning/src/constants/colors.dart';
import 'package:english_learning/src/constants/image_strings.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../welcome/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double textFieldWidth = MediaQuery.of(context).size.width - 40.0;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(tBackground),
                  fit: BoxFit.cover,
                ),
            ),
            padding: const EdgeInsets.all(tDefaultSize),

            child: Column(
              children: [

               const Text("Profile", style: TextStyle(
                  fontSize: tDefaultSize,
                  color: tDarkColor,
                 fontWeight: FontWeight.bold,
                ),
               textAlign: TextAlign.left,
               ),
                const SizedBox(height: tFormHeight-20,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: tTextFieldBackgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Màu của đổ bóng
                      offset: Offset(0, 2), // Độ lệch đổ bóng theo chiều ngang và chiều dọc
                      blurRadius: 4.0, // Độ mờ của đổ bóng
                      spreadRadius: 0.0, // Kích thước đổ bóng
                    ),
                  ],// Đặt BorderRadius cho Container ngoài cùng
                ),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: ClipOval(
                          child: Container(
                            width: 70.0, // Đặt chiều rộng của hình ảnh
                            height: 70.0, // Đặt chiều cao của hình ảnh
                            child: Image.asset(tavt), // Sử dụng Image.asset với đường dẫn hình ảnh
                          ),),
                      ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0), // Khoảng cách 10.0 giữa hình ảnh và văn bản
                      child: const Text(
                        tUserName,
                        style: TextStyle(
                          color: tDarkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: tFormSize,
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
              ),

                const SizedBox(height: tFormHeight-10,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: tTextFieldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, offset: Offset(0, 2), blurRadius: 4.0, spreadRadius: 0.0,
                      ),
                    ],// Đặt BorderRadius cho Container ngoài cùng
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                          child: const Text(tFullName,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: const Text(tFullNameUser,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)

                      ),
                    ],
                  ),
                ),//fulname

                const SizedBox(height: tFormHeight-10,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: tTextFieldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, offset: Offset(0, 2), blurRadius: 4.0, spreadRadius: 0.0,
                      ),
                    ],// Đặt BorderRadius cho Container ngoài cùng
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: const Text(tGender,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: const Text(tGenderUser,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)

                      ),
                    ],
                  ),
                ),//gender

                const SizedBox(height: tFormHeight-10,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: tTextFieldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, offset: Offset(0, 2), blurRadius: 4.0, spreadRadius: 0.0,
                      ),
                    ],// Đặt BorderRadius cho Container ngoài cùng
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: const Text(tDateOfBirth,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: const Text(tDateOfBirthUser,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)

                      ),
                    ],
                  ),
                ),//Dob

                const SizedBox(height: tFormHeight-10,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: tTextFieldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, offset: Offset(0, 2), blurRadius: 4.0, spreadRadius: 0.0,
                      ),
                    ],// Đặt BorderRadius cho Container ngoài cùng
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: const Text(tAddress,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: const Text(tAddressUser,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)

                      ),
                    ],
                  ),
                ),//Address

                const SizedBox(height: tFormHeight-10,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: tTextFieldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, offset: Offset(0, 2), blurRadius: 4.0, spreadRadius: 0.0,
                      ),
                    ],// Đặt BorderRadius cho Container ngoài cùng
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: const Text(tPhone,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: const Text(tPhoneUser,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)

                      ),
                    ],
                  ),
                ),//phone

                const SizedBox(height: tFormHeight-10,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: tTextFieldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, offset: Offset(0, 2), blurRadius: 4.0, spreadRadius: 0.0,
                      ),
                    ],// Đặt BorderRadius cho Container ngoài cùng
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: const Text(tEmail,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: const Text(tEmailUser,
                            style: TextStyle(
                                color: tDarkColor, fontWeight: FontWeight.bold, fontSize: tFontSizeSubTitle
                            ),)

                      ),
                    ],
                  ),
                ),//email

                const SizedBox(height: tFormHeight-10,),
                Container(
                  width: textFieldWidth,
                  child: ElevatedButton(
                    onPressed:() {},
                    child: const Text(tSave,
                      style:  TextStyle(fontSize: tFormSize,
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

                const SizedBox(height: tFormHeight-15,),
                Container(
                  width: textFieldWidth,
                  child: ElevatedButton(
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return WelcomeScreen();
                        }),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(tLogoutButtonColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(tBorderRadiusCircular), // Đặt bán kính cong
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(300.0, 50.0)),
                    ),
                    child: const Text(tLogout,
                      style:  TextStyle(fontSize: tFormSize,
                          color: tLogoutTextColor),
                    ),
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
