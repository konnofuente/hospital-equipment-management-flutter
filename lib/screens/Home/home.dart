import 'package:evaltech_mobile/models/enum.dart';
import 'package:evaltech_mobile/screens/Home/DashBaord/DashBoard.dart';
import 'package:evaltech_mobile/screens/Home/DashBaord/utils/get_screen_fragment.dart';
import 'package:evaltech_mobile/widget/widget_export.dart';
import 'package:flutter/material.dart';

import '../../components/component_export.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String AppBarTitle = 'Gestion Hopital';
  AppDrawerTitle ScreenName = AppDrawerTitle.Home;

  _changeScreenName(AppDrawerTitle val) {
    setState(() {
      ScreenName = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(AppBarTitle, false, const Icon(Icons.menu),
          () => _scaffoldKey.currentState!.openDrawer()),
      drawer: AppDrawer(
        onTapCallBackFunction: _changeScreenName,
      ),
      body: getHomeFragment(ScreenName),
    );
  }
}
