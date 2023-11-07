import 'package:english_learning/src/constants/colors.dart';
import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:english_learning/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/theme/widget_themes/button_theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  Gender? _selectedGender = Gender.Male;
  DateTime? _selectedDate;
  bool _obscureVerifyPasswordText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(tSignUp,
          style: TextStyle(
            fontSize: tDefaultSize,
          ),), // Đặt tiêu đề cho màn hình
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // Sử dụng biểu tượng mũi tên quay lại
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: tBackGroundColor,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tBackground),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: tFormHeight -30),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tFullName,
                            prefixIcon: const Icon(Icons.person_outline_rounded)

                          )
                        ),
                        const SizedBox(height: tFormHeight-10,),
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tEmail,
                            prefixIcon: const Icon(Icons.email_outlined)
                          ),
                        ),
                        const SizedBox(height: tFormHeight-10,),
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tPhone,
                            prefixIcon: const Icon(Icons.phone)
                          )
                        ),
                        const SizedBox(height: tFormHeight-10,),
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tAddress,
                            prefixIcon: const Icon(Icons.add_location_alt_rounded)
                          )
                        ),
                        const SizedBox(height: tFormHeight -10),
                        TextFormField(
                          decoration: TTextFormFieldTheme.inputDecoration(
                            labelText: tDateOfBirth,
                            prefixIcon: const Icon(Icons.date_range),
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
                                  _selectedGender = value;
                                });
                              },
                            ),
                            const Text(tFemale,
                              style: TextStyle(
                                  fontSize: tFormSize),
                            ),
                          ],
                        ),
                        const SizedBox(height: tFormHeight-10,),
                        TextFormField(
                            decoration: TTextFormFieldTheme.inputDecoration(
                                labelText: tUserName,
                                prefixIcon: const Icon(Icons.person)
                            )
                        ),
                        const SizedBox(height: tFormHeight -10),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              obscureText: _obscureText,
                              decoration: TTextFormFieldTheme.inputDecoration(
                                labelText: tPassword,
                                prefixIcon: const Icon(Icons.password),
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
                              obscureText: _obscureVerifyPasswordText,
                              decoration: TTextFormFieldTheme.inputDecoration(
                                labelText: tVerifyPassword,
                                prefixIcon: const Icon(Icons.password),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureVerifyPasswordText = !_obscureVerifyPasswordText;
                                });
                              },
                              icon: Icon(_obscureVerifyPasswordText ? Icons.visibility_off : Icons.visibility),
                            ),
                          ],
                        ),
                        const SizedBox(height: tFormHeight),
                        buildCustomButton(
                          text: tSignUp,
                          onPressed: _signUpButtonPressed,
                          backgroundColor: tBackgroundButtonColor,
                          textColor: tTextButtonColor,
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

   void _signUpButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const WelcomeScreen();
      }),
    );
  }
}