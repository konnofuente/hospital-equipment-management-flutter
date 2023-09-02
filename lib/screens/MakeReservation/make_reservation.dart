// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gestion_hopital/Theme/app_theme.dart';
import 'package:gestion_hopital/Theme/theme_export.dart';
import 'package:gestion_hopital/widget/widget_export.dart';

import '../../models/EquipementItem.dart';

class MakeReservation extends StatefulWidget {
 final EquipmentItem Item;
  const MakeReservation({
    Key? key,
    required this.Item,
  }) : super(key: key);

  @override
  _MakeReservationState createState() => _MakeReservationState();
}

class _MakeReservationState extends State<MakeReservation> {
  DateTime? loanDate;
  DateTime? returnDate;
  TextEditingController quantityController = TextEditingController();
  final TextEditingController loanDateController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Item'),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryblue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display item information with Card
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item Information',
                        style: AppTextTheme.title,
                      ),
                      SizedBox(height: 12),
                      Text('Item Name: ${widget.Item.name}', style: AppTextTheme.body1),
                      Text('Item Description: ${widget.Item.itemDetails}', style: AppTextTheme.body1),
                      Text('Available Quantity: ${widget.Item.quantity}', style: TextStyle(fontSize: 16, color: AppColors.success)),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Loan Date Picker
             WidgetTextForm.getDatePicker(context, "Date de Reservation", loanDateController, null),
              
              SizedBox(height: 10),
              // Return Date Picker
             WidgetTextForm.getDatePicker(context, "Date de Reservation", returnDateController, null),
              
              // Quantity TextField
              SizedBox(height: 10),
        
              WidgetTextForm.getTextField("Quantite", quantityController, TextInputType.text, "Entre une quantite", WidgetIcon.number(false)),
              
              SizedBox(height: 20),
              
              // Loan Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryblue, // background color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {
                  // Handle the loan logic here
                },
                child: Text('Loan', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
