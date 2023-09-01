import 'package:evaltech_mobile/components/AppDrawer.dart';
import 'package:evaltech_mobile/models/enum.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/Components/GroupList/group_list.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/Components/chat_screen.dart';
import 'package:evaltech_mobile/screens/Home/DashBaord/DashBoard.dart';
import 'package:evaltech_mobile/screens/Home/HomeScreen.dart';
import 'package:evaltech_mobile/screens/SettingScreen/Settings.dart';
import 'package:flutter/material.dart';
import '../../../DownloadScreen.dart';
import '../../../EquipementCategory/EquipementCategoryScreen.dart';
import '../../../PastQuestions.dart';
import '../../home.dart';

AppDrawerTitle screen = AppDrawerTitle.Home;
Widget getDashboardFragment(int selectedIndex) {
  if (selectedIndex == 0) {
    return ChatGroupList(
      isTopBar: false,
    );
  } else if (selectedIndex == 1) {
    return HomeScreen();
  } else if (selectedIndex == 2) {
    return EquipementCategoryScreen();
  }
  return HomeScreen();
}

Widget getHomeFragment(AppDrawerTitle val) {
  if (val == AppDrawerTitle.Setting) {
    return SettingScreen();
  } else {
    return DashBoard();
  }
}
