﻿// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:evaltech_mobile/Theme/app_theme.dart';
import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:evaltech_mobile/db/db.dart';
import 'package:evaltech_mobile/models/Document.dart';
import 'package:evaltech_mobile/screens/DocumentViewer/PDFViewerScreen.dart';
import 'package:evaltech_mobile/utils/navigate_screen.dart';
import 'package:evaltech_mobile/widget/equipement_categories/header_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/EquipementCategories.dart';
import '../../widget/equipement_categories/header_content.dart';
import '../../widget/equipement_categories/header_image.dart';
import 'components/get_item_list.dart';


class ListEquipementItem extends StatelessWidget {
  final EquipmentCategories equipment_categories;

  ListEquipementItem(this.equipment_categories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Color.fromRGBO(245, 244, 244, 1),
      body: Column(
        children: <Widget>[
          Expanded(flex: 1, child: HeaderBanner(this.equipment_categories)),
          // Container(child: ListViewHome()),
          Expanded(flex: 2, child: GetItemList( equipmentCategory: this.equipment_categories,)),
        ],
        // ),
        //],
      ),
    );
  }
}


