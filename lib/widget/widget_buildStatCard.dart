// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../Theme/theme_export.dart';

class StatCard {
static Widget NumberCard(String title, String value, Color color,void Function()? onpressed) {
  return InkWell(
    onTap: onpressed,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            )
          ],
        ),
      ),
    ),
  );
}


  static Card EquipementCatInfoCard3(
      String name, String Details) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Item Information',
              style: AppTextTheme.title,
            ),
            const SizedBox(height: 12),
            Text('Item Name: $name', style: AppTextTheme.body1),
            Text('Item Description: $Details', style: AppTextTheme.body1),
            // Text('Available Quantity: ${quantity}',
                // style: TextStyle(fontSize: 16, color: AppColors.success)),
          ],
        ),
      ),
    );
  }

  static Card ReservationInfoCard(
      String name, String Categorie,String returnDate,String reserveDate) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Item Information',
              style: AppTextTheme.title,
            ),
            const SizedBox(height: 12),
            Text('Item Name: $name', style: AppTextTheme.body1),
            Text('Item Categorie: $Categorie', style: AppTextTheme.body1),
            Text('Reserved Date: $reserveDate', style: AppTextTheme.body1),
            Text('Return Date: $returnDate', style: AppTextTheme.body1),
            // Text('Reserved Quantity: ${quantity}',
            //     style: TextStyle(fontSize: 16, color: AppColors.success)),
          ],
        ),
      ),
    );
  }
}
