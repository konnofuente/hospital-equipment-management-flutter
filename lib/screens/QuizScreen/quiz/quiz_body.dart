import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Theme/app_theme.dart';
import '../../../controllers/question_controller.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: AppColors.lightprimaryblue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: _controller.nextQuestion,
              child: Text(
                "Skip",
                style: AppTextTheme.title,
              )),
        ],
      ),
      body: QuizBody(),
    );
  }
}
