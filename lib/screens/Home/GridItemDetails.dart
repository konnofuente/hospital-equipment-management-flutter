// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:evaltech_mobile/Theme/app_theme.dart';
import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:evaltech_mobile/db/db.dart';
import 'package:evaltech_mobile/models/ClassRoom.dart';
import 'package:evaltech_mobile/models/Document.dart';
import 'package:evaltech_mobile/screens/DocumentViewer/PDFViewerScreen.dart';
import 'package:evaltech_mobile/utils/navigate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/Item.dart';
import '../../models/Document.dart';
import '../../widget/classroom/header_content.dart';
import '../../widget/classroom/header_image.dart';

class GridItemDetails extends StatelessWidget {
  final Classroom classroom;

  GridItemDetails(this.classroom);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Color.fromRGBO(245, 244, 244, 1),
      body: Column(
        children: <Widget>[
          Expanded(flex: 1, child: HeaderBanner(this.classroom)),
          // Container(child: ListViewHome()),
          Expanded(flex: 2, child: GetDocumentList()),
        ],
        // ),
        //],
      ),
    );
  }
}

class GetDocumentList extends StatelessWidget {
  //list of document
  List<Document> documents = DB().documents;
  late File pdfFile;

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
                onTap: () async {
                  NavigationScreen.navigate(
                      context,
                      PDFViewerScreen(
                        pdfUrl: documents[index].url,
                        // pdfFile: pdfFile,
                      ));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PDFViewer(document: documents[index]),
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

class HeaderBanner extends StatelessWidget {
  final Classroom classroom;

  HeaderBanner(this.classroom);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      child: Container(
        height: 300.0,
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              HeaderImage(this.classroom.bannerUrl!),
              HeaderContent(this.classroom),
            ],
          ),
        ),
      ),
    );
  }
}
