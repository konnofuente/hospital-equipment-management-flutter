// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:gestion_hopital/Theme/app_theme.dart';
import 'package:gestion_hopital/Theme/text_theme.dart';
import 'package:gestion_hopital/db/db.dart';
import 'package:gestion_hopital/models/Document.dart';
import 'package:gestion_hopital/screens/DocumentViewer/PDFViewerScreen.dart';
import 'package:gestion_hopital/utils/navigate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/EquipementCategories.dart';
import '../../models/Item.dart';
import '../../models/Document.dart';
import '../../widget/equipement_categories/header_content.dart';
import '../../widget/equipement_categories/header_image.dart';

class GridItemDetails extends StatelessWidget {
  final EquipmentCategories equipment_categories;

  GridItemDetails(this.equipment_categories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Color.fromRGBO(245, 244, 244, 1),
      body: Column(
        children: <Widget>[
          Expanded(flex: 1, child: HeaderBanner(this.equipment_categories)),
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
  final EquipmentCategories equipment_categories;

  HeaderBanner(this.equipment_categories);

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
              HeaderImage(this.equipment_categories.bannerUrl!),
              HeaderContent(this.equipment_categories),
            ],
          ),
        ),
      ),
    );
  }
}
