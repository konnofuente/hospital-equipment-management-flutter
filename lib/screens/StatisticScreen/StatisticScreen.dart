import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
      child: Text(
        "No Statistics available",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          // color: AppColors.danger
        ),
      ),
    )
      ),
    );;
  }
}
