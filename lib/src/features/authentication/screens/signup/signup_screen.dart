import 'package:english_learning/src/constants/colors.dart';
import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

import '../../../../constants/text_strings.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Gender? _selectedGender = Gender.male;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tBackGroundColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40.0), // Đặt top thành 20 pixel
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tSignUpTitle,
                          style: TextStyle(
                            fontSize: tFontSizeTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text( tSignUpSubTitle, // Thay bằng subtitle bạn muốn
                          style: TextStyle(
                            fontSize: tFontSizeSubTitle, // Tuỳ chỉnh kích thước và kiểu dáng của subtitle
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: tFormHeight -10),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tFullName,
                            prefixIcon: Icon(Icons.person_outline_rounded)

                          )
                        ),
                        const SizedBox(height: tFormHeight-10,),
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tEmail,
                            prefixIcon: Icon(Icons.email_outlined)
                          )
                        ),
                        const SizedBox(height: tFormHeight-10,),
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tPhone,
                            prefixIcon: Icon(Icons.phone)
                          )
                        ),
                        const SizedBox(height: tFormHeight-10,),
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tAddress,
                            prefixIcon: Icon(Icons.add_location_alt_rounded)
                          )
                        ),
                        const SizedBox(height: tFormHeight -10),
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tDateOfBirth,
                            prefixIcon: Icon(Icons.date_range),
                          ),
                          onTap: () {
                            _selectDate(context);
                          },
                          controller: TextEditingController(
                            text: _selectedDate != null
                                ? "${_selectedDate?.toLocal()}".split(' ')[0]
                                : "",
                          ),
                          readOnly: true,
                        ),
                        const SizedBox(height: tFormHeight -10),
                        Row(
                          children: <Widget>[
                            Text(
                              tGender, // Label for gender
                              style: TextStyle(
                                fontSize: tFormSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Radio<Gender>(
                              value: Gender.male,
                              groupValue: _selectedGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text(tMale,
                              style: TextStyle(
                                  fontSize: tFormSize
                              ),),
                            Radio<Gender>(
                              value: Gender.female,
                              groupValue: _selectedGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text(tFemale,
                              style: TextStyle(
                                  fontSize: tFormSize),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
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
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}