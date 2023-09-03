    
    import 'package:flutter/material.dart';

import '../../../models/EquipementCategories.dart';
import '../../ItemReservation/item_reservation.dart';
import '../../ListEquipementItem/list_equipement_item.dart';
import '../components/add_form_equipment_item.dart';


Widget adminGetFragment(int selectedIndex , EquipmentCategories globalItem) {
      if (selectedIndex == 0) {
        return ListEquipementItem(globalItem);
      } else if (selectedIndex == 1) {
        return AddFormEquipementItem(
          equipmentCategory: globalItem,
        );
      } else if (selectedIndex == 2) {
        return ItemReservation();
      }
      return ListEquipementItem(globalItem);
    }

Widget responsibleGetFragment(int selectedIndex , EquipmentCategories globalItem) {
      // if (selectedIndex == 0) {
      //   return ListEquipementItem(globalItem);
      // } else if (selectedIndex == 1) {
      //   return Container();
      // }
      // return ListEquipementItem(globalItem);
        return ListEquipementItem(globalItem);
    }