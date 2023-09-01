import 'package:flutter/material.dart';

class PastQuestionsScreen extends StatefulWidget {
  const PastQuestionsScreen({Key? key}) : super(key: key);

  @override
  State<PastQuestionsScreen> createState() => _PastQuestionsScreenState();
}

class _PastQuestionsScreenState extends State<PastQuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Text(
        "No Information available",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          // color: AppColors.danger
        ),
      ),
    )
    );;
  }
}
