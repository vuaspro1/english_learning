import 'package:english_learning/src/features/authentication/screens/test/utils/const.dart';
import 'package:english_learning/src/features/authentication/screens/test/widgets/show_answer.dart';
import 'package:english_learning/src/features/authentication/screens/test/widgets/test_button.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
class  QuestionBox extends StatefulWidget {
  const QuestionBox ({super.key});
  @override
  State<QuestionBox> createState() => _QuestionBoxState();
  }
  class _QuestionBoxState extends State<QuestionBox> {
  final PageController pageController = PageController();

  void handleSubmit() async {
    await showAnswer(context);
  }
  @override
    Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      controller: PageController(),
      itemCount: 3,
      itemBuilder: (context, int){
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Image.asset(
                  'assets/images/img.png',
                  width: 320,
                  height: 320,
                  fit: BoxFit.fitHeight
                ),
              SizedBox(height: getHeight(context)*0.02,),
              const Text ('Look at the picture and use a vocabulary word to describe the action taking place',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your answer....',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6CEEBF))
                    )
                  ),
                ),
              ),
              SizedBox(height: getHeight(context)*0.02,),
              ButtonCustom(
                  onTap: handleSubmit,
                  title: 'Check'
              ),
            ],
          ),
        );
      },

    );
  }
}
