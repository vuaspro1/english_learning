import 'package:english_learning/src/constants/colors.dart';
import 'package:english_learning/src/constants/image_strings.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:english_learning/src/features/authentication/screens/profile/EditProfile.dart';
import 'package:flutter/material.dart';


import '../../../../constants/sizes.dart';
import '../../../../utils/theme/widget_themes/button_theme.dart';
import '../../../../utils/theme/widget_themes/text_field_row_theme.dart';
import '../welcome/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

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
               //
               // const Text(tProfile, style: TextStyle(
               //    fontSize: tDefaultSize,
               //    color: tDarkColor,
               //   fontWeight: FontWeight.bold,
               //  ),
               // textAlign: TextAlign.left,
               // ),
               //  const SizedBox(height: tFormHeight,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: tTextFieldBackgroundColor,
                  borderRadius: BorderRadius.circular(tBorderRadiusCircular),
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

                const SizedBox(height: tFormHeight - 10),
                buildTextFieldRow(tFullName, tFullNameUser),
                const SizedBox(height: tFormHeight - 10),
                buildTextFieldRow(tGender, tGenderUser),
                const SizedBox(height: tFormHeight - 10),
                buildTextFieldRow(tDateOfBirth, tDateOfBirthUser),
                const SizedBox(height: tFormHeight - 10),
                buildTextFieldRow(tAddress, tAddressUser),
                const SizedBox(height: tFormHeight - 10),
                buildTextFieldRow(tPhone, tPhoneUser),
                const SizedBox(height: tFormHeight - 10),
                buildTextFieldRow(tEmail, tEmailUser),//email

                const SizedBox(height: tFormHeight - 10),
                buildCustomButton(
                  text: tEdit,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                       return EditProfile();
                     }),
                    );
                  },
                  backgroundColor: tBackgroundButtonColor,
                  textColor: tTextButtonColor,
                ),
                const SizedBox(height: tFormHeight - 15),
                buildCustomButton(
                  text: tLogout,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: Icon(Icons.error,
                            color: tDarkColor,
                          ),
                          title: const Text(tExit),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return WelcomeScreen();
                                  }),
                                );
                                //Navigator.of(context).pop(); // Close the error dialog
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
                            const SizedBox(
                              width: 100.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the error dialog
                              },
                              child: const Text(tNo),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(tSuccessfullyColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(tBorderRadiusCircular), // Đặt bán kính cong
                                  ),
                                ),
                                // minimumSize: MaterialStateProperty.all(Size(300.0, 50.0)),
                              ),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                          ],
                        );
                      },
                    );

                  },
                  backgroundColor: tLogoutButtonColor,
                  textColor: tLogoutTextColor,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
