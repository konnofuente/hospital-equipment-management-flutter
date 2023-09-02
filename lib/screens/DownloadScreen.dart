import 'package:gestion_hopital/screens/DocumentViewer/latexScreen.dart';
import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: LatexScreen(),
        body: Center(
      child: Text(
        "No Download available",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          // color: AppColors.danger
        ),
      ),
    ));
  }
}
