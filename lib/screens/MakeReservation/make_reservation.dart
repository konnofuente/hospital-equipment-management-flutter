// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gestion_hopital/Theme/app_theme.dart';
import 'package:gestion_hopital/Theme/theme_export.dart';
import 'package:gestion_hopital/models/ReservationDetails.dart';
import 'package:gestion_hopital/models/function.dart';
import 'package:gestion_hopital/provider/provider.dart';
import 'package:gestion_hopital/services/reservationService.dart';
import 'package:gestion_hopital/widget/widget_export.dart';
import 'package:provider/provider.dart';

import '../../models/EquipementItem.dart';
import '../../models/Reservation.dart';
import '../../models/User.dart';

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
  final TextEditingController reserveDateController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? actaulUser = Provider.of<UserManagement>(context).actaulUser;

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
                      Text('Item Name: ${widget.Item.name}',
                          style: AppTextTheme.body1),
                      Text('Item Description: ${widget.Item.itemDetails}',
                          style: AppTextTheme.body1),
                      Text('Available Quantity: ${widget.Item.quantity}',
                          style: TextStyle(
                              fontSize: 16, color: AppColors.success)),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Loan Date Picker
              WidgetTextForm.getDatePicker(
                  context, "Date de reservation", reserveDateController, null),

              SizedBox(height: 10),
              // Return Date Picker
              WidgetTextForm.getDatePicker(
                  context, "Date de retour", returnDateController, null),

              // Quantity TextField
              SizedBox(height: 10),

              WidgetTextForm.getTextField(
                  "Quantite",
                  quantityController,
                  TextInputType.number,
                  "Entre une quantite",
                  WidgetIcon.number(false)),

              SizedBox(height: 20),

              // Loan Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryblue, // background color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {
                  makeReservation(actaulUser!);
                },
                child: Text('Loan', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void formInformation(User actaulUser) {
    try {
      int reservedQuantity = int.parse(quantityController.text);
      DateTime reserveDate = DateTime.parse(reserveDateController.text);
      DateTime returnDate = DateTime.parse(returnDateController.text);

      // Assuming generateReservationId() and generateReservationDetailsId()
      // are methods that generate unique IDs.
      int newReservationId = AppFunction().generateUserId(actaulUser.email!);

      ReservationDetails newReservationDetail = ReservationDetails(
          id: AppFunction().generateUserId(actaulUser.id.toString()),
          reservationId: newReservationId,
          equipmentItemId: widget.Item.id,
          reservedQuantity: reservedQuantity,
          reserveDate: reserveDate,
          returnDate: returnDate);

      Reservation newReservation = Reservation(
          id: newReservationId,
          userId: actaulUser.id!,
          reservationDetails: [newReservationDetail]);

      ReservationServices.SaveRegistration(context, newReservation);

      // print(newReservation);
    } catch (e) {
      // Handle your error here
      print(e);
    }
  }

  void makeReservation(User actaulUser) {
    // Validate that all fields are not empty
    if (reserveDateController.text.isEmpty ||
        returnDateController.text.isEmpty ||
        quantityController.text.isEmpty) {
      AlertBox.alertbox(
          context, "Reservation", "All fields must be filled", () {});
      return;
    }

    // Validate that reservation date is before return date
    DateTime reserveDate = DateTime.parse(reserveDateController.text);
    DateTime returnDate = DateTime.parse(returnDateController.text);
    if (reserveDate.isAfter(returnDate) ||
        reserveDate.isAtSameMomentAs(returnDate)) {
      AlertBox.alertbox(context, "Reservation",
          "Reservation date must be before return date", () {});
      return;
    }

    // Validate that reserved quantity is less than or equal to available quantity
    int reservedQuantity = int.parse(quantityController.text);
    if (reservedQuantity > widget.Item.quantity) {
      AlertBox.alertbox(context, "Reservation",
          "Reserved quantity cannot exceed available quantity", () {});
      return;
    }

    formInformation(actaulUser);

    // Show success message
    AlertBox.alertbox(
        context, "Reservation", "Equipement Reserve avec sucess!!", () {});
  }
}
