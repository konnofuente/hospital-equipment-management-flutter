// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gestion_hopital/Theme/app_theme.dart';
import 'package:gestion_hopital/Theme/theme_export.dart';
import 'package:gestion_hopital/models/ReservationDetails.dart';
import 'package:gestion_hopital/models/Status.dart';
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
  TextEditingController motifReservationController = TextEditingController();
  Status? selectedStatus;

  @override
  Widget build(BuildContext context) {
    User? actaulUser = Provider.of<UserManagement>(context).actaulUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Item'),
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
              StatCard.EquipementCatInfoCard3(
                  widget.Item.name, widget.Item.description),

              const SizedBox(height: 20),

              // Loan Date Picker
              WidgetTextForm.getDatePicker(
                  context, "Date de reservation", reserveDateController, null),

              const SizedBox(height: 10),
              // Return Date Picker
              WidgetTextForm.getDatePicker(
                  context, "Date de retour", returnDateController, null),
              // Quantity TextField
              const SizedBox(height: 10),
              WidgetTextForm.getTextField(
                  "Motif de reservation",
                  motifReservationController,
                  TextInputType.text,
                  "Entre le motif",
                  WidgetIcon.description(false)),

              const SizedBox(height: 20),

              DropdownButton<Status>(
                hint: Text("Volez vous reservez ou emprunter"),
                value: selectedStatus,
                onChanged: (Status? newValue) {
                  setState(() {
                    selectedStatus = newValue;
                  });
                },
                items: [Status.RESERVE, Status.BORROW]
                    .map<DropdownMenuItem<Status>>((Status value) {
                  return DropdownMenuItem<Status>(
                    value: value,
                    child: Text(value.toString().split('.').last),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              // Loan Button
              WidgetButton.largeButton("Reserve", AppTextTheme.buttonwhite,
                  AppColors.primaryblue, null, () {
                makeReservation(actaulUser!);
              })
            ],
          ),
        ),
      ),
    );
  }

  void formInformation(User actaulUser) {
    try {
      // int reservedQuantity = int.parse(quantityController.text);
      DateTime reserveDate = DateTime.parse(reserveDateController.text);
      DateTime returnDate = DateTime.parse(returnDateController.text);

      // Assuming generateReservationId() and generateReservationDetailsId()
      // are methods that generate unique IDs.
      int newReservationId = AppFunction().generateUserId(actaulUser.email!);

      ReservationDetails newReservationDetail = ReservationDetails(
          id: AppFunction().generateUserId(actaulUser.id.toString()),
          reservationId: newReservationId,
          equipmentItemId: widget.Item.id,
          status: selectedStatus ?? Status.PENDINGRESERVE,
          reservationReason: motifReservationController.text,
          reserveDate: reserveDate,
          returnDate: returnDate);

      Reservation newReservation = Reservation(
          id: newReservationId,
          userId: actaulUser.id!,
          reservationDetails: [newReservationDetail]);

      ReservationServices.SaveReservation(context, newReservation);

      // print(newReservation);
    } catch (e) {
      // Handle your error here
      print(e);
    }
  }

  void makeReservation(User actaulUser) {
    // Validate that all fields are not empty
    if (reserveDateController.text.isEmpty ||
        returnDateController.text.isEmpty) {
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
    // int reservedQuantity = int.parse(quantityController.text);
    // if (reservedQuantity > widget.Item.quantity) {
    //   AlertBox.alertbox(context, "Reservation",
    //       "Reserved quantity cannot exceed available quantity", () {});
    //   return;
    // }

    formInformation(actaulUser);
  }
}
