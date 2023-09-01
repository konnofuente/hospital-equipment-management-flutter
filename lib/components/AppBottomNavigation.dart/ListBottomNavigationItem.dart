import 'package:flutter/material.dart';

import '../../Theme/theme_export.dart';
import '../../services/localisationService/t_key.dart';

class ListBottomNavigationItem {
  
   List<BottomNavigationBarItem> dashboardListItem(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/Icons/icon_group.png',
          height: 24.66,
          width: 24.66,
          fit: BoxFit.cover,
          color: Color.fromRGBO(78, 86, 107, 1),
        ),
        label: TKeys.group.translate(context),
        activeIcon: Image.asset(
          'assets/Icons/icon_group.png',
          height: 24.66,
          width: 24.66,
          fit: BoxFit.cover,
          color: AppColors.primarydark,
        ),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/Icons/icon_home.png',
          height: 24.66,
          width: 24.66,
          fit: BoxFit.cover,
          color: Color.fromRGBO(78, 86, 107, 1),
        ),
        label: TKeys.home.translate(context),
        activeIcon: Image.asset(
          'assets/Icons/icon_home_fill.png',
          height: 24.66,
          width: 24.66,
          fit: BoxFit.cover,
        ),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/Icons/icon_downloads.png',
          height: 24.66,
          width: 24.66,
          fit: BoxFit.cover,
          color: Color.fromRGBO(78, 86, 107, 1),
        ),
        label: TKeys.download.translate(context),
        activeIcon: Image.asset(
          'assets/Icons/icon_downloads_fill.png',
          height: 23.00,
          width: 23.00,
          fit: BoxFit.cover,
        ),
      ),
    ];
  }
}
