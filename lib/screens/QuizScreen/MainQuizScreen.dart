// ignore_for_file: prefer_const_constructors

import 'package:evaltech_mobile/Theme/app_theme.dart';
import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:evaltech_mobile/screens/Home/GetRatings.dart';
import 'package:evaltech_mobile/screens/QuizScreen/quiz/quiz_body.dart';
import 'package:evaltech_mobile/screens/QuizScreen/welcome/welcome_screen.dart';
import 'package:evaltech_mobile/utils/navigate_screen.dart';
import 'package:evaltech_mobile/widget/equipement_categories/header_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../models/EquipementCategories.dart';
import '../../models/Item.dart';
import '../../models/Document.dart';
import '../../provider/provider.dart';
import '../../widget/equipement_categories/header_content.dart';
import '../../widget/equipement_categories/header_image.dart';

class MainQuizScreen extends StatefulWidget {
  // final Item equipment_categories;

  // MainQuizScreen(this.equipment_categories);
  MainQuizScreen();

  @override
  State<MainQuizScreen> createState() => _MainQuizScreenState();
}

class _MainQuizScreenState extends State<MainQuizScreen> {
  bool isMCQAvailable = false; // Set this to true if MCQ is available
  @override
  Widget build(BuildContext context) {

    EquipmentCategories globalItem =
        Provider.of<EquipmentCategoriesState>(context).equipment_categories!
            as EquipmentCategories;
    return Scaffold(
      primary: true,
      backgroundColor: Color.fromRGBO(245, 244, 244, 1),
      body: Column(
        children: <Widget>[
          Expanded(flex: 1, child: HeaderBanner(globalItem)),
          Expanded(
            flex: 1,
            child: isMCQAvailable ? GetDocumentList() : MCQNotAvailable(),
          ),
        ],
      ),
    );
  }
}

class MCQNotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Quiz not yet available available",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.danger),
      ),
    );
  }
}

class GetDocumentList extends StatelessWidget {
  List<Document> documents = [
    Document(
      title: "Introduction to ICT and Various Notions",
      subtitle: "Here is list 1 subtitle",
      url: "https://www.example.com/document1.pdf",
      icon: Icon(Icons.picture_as_pdf),
      isLocked: false,
    ),
    Document(
      title: "Chapter 2: A Large View",
      subtitle: "Here is list 2 subtitle",
      url: "https://www.example.com/document2.pdf",
      icon: Icon(Icons.picture_as_pdf),
      isLocked: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
        height: 800.0,
        child: ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>QuizScreen(),
                  //   ),
                  // );
                },
                title: Text(
                  documents[index].title,
                  style: AppTextTheme.listtitle,
                ),
                subtitle: Text(documents[index].subtitle),
                leading: (documents[index].icon),
                trailing: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Icon(Icons.more_horiz),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        documents[index].isLocked
                            ? Icons.lock
                            : Icons.lock_open_sharp,
                        color: documents[index].isLocked
                            ? AppColors.danger
                            : AppColors.success,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


