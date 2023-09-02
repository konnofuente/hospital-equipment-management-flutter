import 'package:gestion_hopital/components/AppBottomNavigation.dart/DashBaordBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../Theme/app_theme.dart';
import '../../../components/component_export.dart';
import '../../../services/localisationService/t_key.dart';
import '../../../widget/get_screen_fragment.dart';
import '../../../widget/widget_export.dart';

class ResponsibleDashBoard extends StatefulWidget {
  const ResponsibleDashBoard({Key? key}) : super(key: key);

  @override
  State<ResponsibleDashBoard> createState() => ResponsibleDashBoardState();
}

class ResponsibleDashBoardState extends State<ResponsibleDashBoard> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  int selectedIndex = 0;
  String AppBarTitle = 'Responsable';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _changeSelectedIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: getResponsipleDashboardFragment(selectedIndex),
        bottomNavigationBar: DashBoardBottomNavigation(
          selectedIndex: selectedIndex,
          // ignore: void_checks
          OnTapCallbackfunction: _changeSelectedIndex,
        ));
  }
}
