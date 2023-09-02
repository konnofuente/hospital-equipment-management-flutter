import 'package:gestion_hopital/db/db.dart';
import 'package:gestion_hopital/models/EquipementCategories.dart';
import 'package:gestion_hopital/screens/AllEquipementCategories/components/all_equipement_categoriesList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constant/constants.dart';
import '../../models/Item.dart';
import '../../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<EquipmentCategories> classList;

  @override
  void initState() {
    super.initState();
    classList = DB().EquipmentCategoriesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _gridView(),
    );
  }

  Widget _gridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(4.0),
      childAspectRatio: 8.0 / 9.0,
      children: classList
          .map(
            (Item) => AllEquipmentCategoriesList(equipment_categories: Item),
          )
          .toList(),
    );
  }
}
