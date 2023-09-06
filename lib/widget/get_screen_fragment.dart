import 'package:gestion_hopital/models/Role.dart';
import 'package:gestion_hopital/models/enum.dart';
import 'package:gestion_hopital/screens/AllEquipementCategories/all_equipement_categoryScreen.dart';
import 'package:gestion_hopital/screens/AuthScreens/sign_up/signup_screen.dart';
import 'package:gestion_hopital/screens/Projet/projet.dart';
import 'package:gestion_hopital/screens/SettingScreen/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/User.dart';
import '../provider/provider.dart';
import '../screens/Home/AdminDashBaord/admin_dashBoard.dart';
import '../screens/ResponsibleDashBaord/responsible_dashBoard.dart';
import '../screens/StatisticAdmin/statistics_admin.dart';
import '../screens/StatisticsResponsible/statistics_responsible.dart';

AppDrawerTitle screen = AppDrawerTitle.Home;

Widget getAdminDashboardFragment(int selectedIndex) {
  if (selectedIndex == 0) {
    return SignUp();
  } else if (selectedIndex == 1) {
    return AllEquipementCategoryScreen();
  } else if (selectedIndex == 2) {
    return StatisticAdminScreen();
  }
  return AllEquipementCategoryScreen();
}

Widget getResponsipleDashboardFragment(
    BuildContext context, int selectedIndex) {
  User actaulUser = Provider.of<UserManagement>(context).actaulUser!;
  if (selectedIndex == 0) {
    return AllEquipementCategoryScreen();
  } else if (selectedIndex == 1) {
    return StatisticResponsibleScreen(UserId: actaulUser.id!);
  }
  return AllEquipementCategoryScreen();
}

Widget getHomeFragment(BuildContext context, AppDrawerTitle val) {
  User? actaulUser =
      Provider.of<UserManagement>(context, listen: false).actaulUser;

  if (val == AppDrawerTitle.Setting) {
    return SettingScreen();
  } else {
    return actaulUser!.role == Role.RESPONSABLE.name
        ? ResponsibleDashBoard()
        : AdminDashBoard();
  }
}
