import 'package:evaltech_mobile/db/db.dart';
import 'package:evaltech_mobile/screens/Home/ClassroomList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constant/constants.dart';
import '../../models/ClassRoom.dart';
import '../../models/Item.dart';
import '../../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Classroom> classList;

  @override
  void initState() {
    super.initState();
    classList = DB().ClassroomList;
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
            (Item) => ClassroomList(classroom: Item),
          )
          .toList(),
    );
  }
}
