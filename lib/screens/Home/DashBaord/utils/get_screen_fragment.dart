import 'package:evaltech_mobile/models/enum.dart';
import 'package:evaltech_mobile/screens/AllEquipementCategories/all_equipement_categoryScreen.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/Components/GroupList/group_list.dart';
import 'package:evaltech_mobile/screens/Home/DashBaord/DashBoard.dart';
import 'package:evaltech_mobile/screens/Projet/projet.dart';
import 'package:evaltech_mobile/screens/SettingScreen/Settings.dart';
import 'package:flutter/material.dart';

import '../../../Statistics/statistics.dart';

AppDrawerTitle screen = AppDrawerTitle.Home;
Widget getDashboardFragment(int selectedIndex) {
  if (selectedIndex == 0) {
    return ProjetScreen();
  } else if (selectedIndex == 1) {
    return AllEquipementCategoryScreen();
  } else if (selectedIndex == 2) {
    return StatisticScreen();
  }
    return AllEquipementCategoryScreen();
}

Widget getHomeFragment(AppDrawerTitle val) {
  if (val == AppDrawerTitle.Setting) {
    return SettingScreen();
  } else {
    return DashBoard();
  }
}
