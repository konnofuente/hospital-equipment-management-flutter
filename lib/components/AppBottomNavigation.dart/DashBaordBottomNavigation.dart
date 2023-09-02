import 'package:gestion_hopital/components/AppBottomNavigation.dart/ListBottomNavigationItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Theme/theme_export.dart';
import '../../models/Role.dart';
import '../../models/User.dart';
import '../../provider/provider.dart';

class DashBoardBottomNavigation extends StatefulWidget {
  late int selectedIndex;
  late Function OnTapCallbackfunction;
  // final Function(int) onTabSelected;

  DashBoardBottomNavigation(
      {required this.selectedIndex, required this.OnTapCallbackfunction
      // required this.onTabSelected,
      });

  @override
  State<DashBoardBottomNavigation> createState() =>
      _DashBoardBottomNavigationState();
}

class _DashBoardBottomNavigationState extends State<DashBoardBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    User? actaulUser =
        Provider.of<UserManagement>(context, listen: false).actaulUser;

    return BottomNavigationBar(
      showSelectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.bottomtap,
      items: actaulUser!.role == Role.RESPONSABLE.name
          ? ListBottomNavigationItem().ResponsibleDashboardListItem(context)
          : ListBottomNavigationItem().adminDashboardListItem(context),
      onTap: (val) {
        widget.OnTapCallbackfunction(val);
      },
      currentIndex: widget.selectedIndex,
    );
  }
}
