import 'package:evaltech_mobile/Theme/app_theme.dart';
import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:evaltech_mobile/screens/QuizScreen/MainQuizScreen.dart';
import 'package:evaltech_mobile/screens/QuizScreen/quiz/quiz_body.dart';
import 'package:evaltech_mobile/screens/TestQuestions/TQuiz.dart';
import 'package:evaltech_mobile/screens/TestQuestions/Tmain.dart';
import 'package:evaltech_mobile/utils/navigate_screen.dart';
import 'package:evaltech_mobile/widget/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightprimaryblue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              // height: 250,
              // width: 250,
              padding: EdgeInsets.all(20),
              child: Image.asset(
                'assets/Images/quizComputer.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                WidgetButton.largeButton(
                    'Start', AppTextTheme.buttonwhite, AppColors.black, null,
                    () {
                  NavigationScreen.replaceNavigate(context, Tmain());
                  // Get.off(QuizScreen());
                  // Get.to(QuizScreen());
                }),
                SizedBox(
                  height: 10,
                ),
                WidgetButton.largeButton(
                    'Cancel', AppTextTheme.buttonwhite, AppColors.black, null,
                    () {
                  // NavigationScreen.replaceNavigate(context, EquipmentCategoriesScreen());
                  Navigator.pop(context);
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}








                  // InkWell(
                  //   onTap: () => Get.to(QuizScreen()),
                  //   child: Container(
                  //     width: double.infinity,
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                  //     decoration: BoxDecoration(
                  //       gradient: kPrimaryGradient,
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //     child: Text(
                  //       "Lets Start Quiz",
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .button
                  //           ?.copyWith(color: Colors.black),
                  //     ),
                  //   ),
                  // ),