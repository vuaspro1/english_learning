

import 'package:english_learning/src/features/authentication/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/theme/widget_themes/button_theme.dart';
import '../../../../utils/theme/widget_themes/text_field_theme.dart';



class EditProfile extends StatefulWidget {
   EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Gender? _selectedGender = Gender.Male;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(tEditProfile),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), // Sử dụng biểu tượng mũi tên quay lại
              onPressed: () {
                // Xử lý sự kiện khi người dùng nhấn biểu tượng
                // Điều hướng đến trang khác ở đây
                Navigator.pop(context);
              },
            ),
        ),
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
                const SizedBox(height: tFormHeight),
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
                          margin: const EdgeInsets.only(left: 20.0),
                          child: ClipOval(
                            child: Container(
                              width: 70.0, // Đặt chiều rộng của hình ảnh
                              height: 70.0, // Đặt chiều cao của hình ảnh
                              child: Image.asset(tavt), // Sử dụng Image.asset với đường dẫn hình ảnh
                            ),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20.0), // Khoảng cách 10.0 giữa hình ảnh và văn bản
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

                const SizedBox(height: tFormHeight -5),
                TextFormField(
                    decoration: TTextFormFieldTheme.inputDecoration(
                        labelText: tFullName,
                        prefixIcon: const Icon(Icons.person_outline_rounded)
                    ),
                  initialValue: tFullNameUser, // Hiển thị giá trị hiện tại
                  onChanged: (value) {
                    tFullNameUser = value; // Cập nhật giá trị khi người dùng chỉnh sửa
                  },
                ),

                const SizedBox(height: tFormHeight - 15),
                Row(
                  children: <Widget>[
                    const Text(
                      tGender, // Label for gender
                      style: TextStyle(
                        fontSize: tFormSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Radio<Gender>(
                      value: Gender.Male,
                      groupValue: _selectedGender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const Text(tMale,
                      style: TextStyle(
                          fontSize: tFormSize
                      ),),
                    Radio<Gender>(
                      value: Gender.Female,
                      groupValue: _selectedGender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _selectedGender = value ;
                        });
                      },
                    ),
                    const Text(tFemale,
                      style: TextStyle(
                          fontSize: tFormSize),
                    ),
                  ],
                ),
                // TextFormField(
                //   initialValue: tGenderUser,
                //   onChanged: (value) {
                //     tGenderUser = value;
                //   },
                // ),
                const SizedBox(height: tFormHeight - 15),
                TextFormField(
                  decoration: TTextFormFieldTheme.inputDecoration(
                    labelText: tDateOfBirth,
                    prefixIcon: const Icon(Icons.date_range),
                  ),
                  onTap: () async {
                    _selectDate(context);
                  },
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? "${_selectedDate?.toLocal()}".split(' ')[0]
                        : tDateOfBirthUser,
                  ),

                  onChanged: (value) {
                    tDateOfBirthUser = value;
                  },
                  readOnly: true,
                ),


                const SizedBox(height: tFormHeight - 5),
                TextFormField(
                  decoration: TTextFormFieldTheme.inputDecoration(
                      labelText: tAddress,
                      prefixIcon: const Icon(Icons.add_location_alt_rounded)
                  ),
                  initialValue: tAddressUser,
                  onChanged: (value) {
                    tAddressUser = value;
                  },
                ),

                const SizedBox(height: tFormHeight - 5),
                TextFormField(
                  decoration: TTextFormFieldTheme.inputDecoration(
                      labelText: tPhone,
                      prefixIcon: const Icon(Icons.phone)
                  ),
                  initialValue: tPhoneUser,
                  onChanged: (value) {
                    tPhoneUser = value;
                  },
                ),

                const SizedBox(height: tFormHeight - 5),
                TextFormField(
                  decoration: TTextFormFieldTheme.inputDecoration(
                      labelText: tEmail,
                      prefixIcon: const Icon(Icons.email)
                  ),
                  initialValue: tEmailUser,
                  onChanged: (value) {
                    tEmailUser = value;
                  },
                ),


                const SizedBox(height: tFormHeight - 5),
                buildCustomButton(
                  text: tSave,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: const Icon(Icons.check,
                            color: tSuccessfullyColor,
                          ),
                          title: const Text(tSaveProfile),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return const ProfileScreen();

                                  }),
                                ); // Close the error dialog
                              },
                              child: const Text(tClose),
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
                          ],
                        );
                      },
                    );

                    tGenderUser = _selectedGender.toString().split('.')[1];
                  },
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
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        tDateOfBirthUser = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}

