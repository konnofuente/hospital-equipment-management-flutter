import 'package:evaltech_mobile/screens/Home/DashBaord/DashBoard.dart';
import 'package:evaltech_mobile/screens/QuizScreen/MainQuizScreen.dart';
import 'package:evaltech_mobile/screens/QuizScreen/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../Theme/app_theme.dart';
import '../../../Theme/text_theme.dart';
import '../../../controllers/question_controller.dart';
import '../../../models/Item.dart';
import '../../../provider/provider.dart';
import '../../../size_config.dart';
import '../../../utils/navigate_screen.dart';
import '../../../widget/widget_button.dart';
import '../../Home/GridItemDetails.dart';
import '../quiz/quiz_body.dart';

class ScoreScreen extends StatefulWidget {
  final int score;
  final int totalquestion;

  const ScoreScreen({
    Key? key,
    required this.score,
    required this.totalquestion,
  }) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightprimaryblue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              "Your Score",
              style: AppTextTheme.title,
            ),
            SizedBox(height: 10),
            Text(
              "${widget.score} / ${widget.totalquestion}",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: kSecondaryColor),
            ),
            SizedBox(height: 20),
            // Expanded(
            //   child: Image.asset(
            //     "assets/images/scoreboard.png",
            //     fit: BoxFit.contain,
            //   ),
            // ),
            SizedBox(height: 30),
            WidgetButton.largeButton(
              'Get Back',
              AppTextTheme.buttonwhite,
              AppColors.black,
              null,
              () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
