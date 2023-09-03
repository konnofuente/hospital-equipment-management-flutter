// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gestion_hopital/Theme/theme_export.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_bloc.dart';
import 'package:gestion_hopital/bloc/bloc_export.dart';
import 'package:gestion_hopital/models/ReservationDetails.dart';
import 'package:gestion_hopital/models/Status.dart';
import 'package:gestion_hopital/models/function.dart';
import 'package:gestion_hopital/provider/provider.dart';
import 'package:gestion_hopital/services/reservationService.dart';
import 'package:gestion_hopital/widget/widget_export.dart';
import 'package:provider/provider.dart';

import '../../bloc/ReservationBloc/reservation_event.dart';
import '../../models/EquipementItem.dart';
import '../../models/Reservation.dart';
import '../../models/User.dart';

class ReservationDetailsScreen extends StatefulWidget {
  final ReservationDetails Item;
  const ReservationDetailsScreen({
    Key? key,
    required this.Item,
  }) : super(key: key);

  @override
  _ReservationDetailsScreenState createState() =>
      _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
  DateTime? loanDate;
  DateTime? returnDate;
  TextEditingController quantityController = TextEditingController();
  final TextEditingController reserveDateController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();

  void returnItem(BuildContext context) {
    AlertBox.awesomeOkBox(context, "Reservation",
        "Votre retour de cette equipement serais en attende de valisation  par l'administrateur",
        () {
      // widget.Item.
      User? actaulUser =
          Provider.of<UserManagement>(context, listen: false).actaulUser;

      ReservationBloc reservationBloc =
          BlocProvider.of<ReservationBloc>(context);
      reservationBloc.add(UpdateReservationDetailStatus(
          userId: actaulUser!.id!,
          reservationDetailId: widget.Item.id,
          status: Status.PENDINGRETURN));
    });
  }

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
              StatCard.ReservationInfoCard(
                  widget.Item.id.toString(),
                  widget.Item.equipmentItemId.toString(),
                  widget.Item.reservedQuantity.toString(),
                  widget.Item.returnDate.toString(),
                  widget.Item.returnDate.toString()),

              SizedBox(height: 20),

              // Loan Button
              WidgetButton.largeButton("Retourne l'equipement",
                  AppTextTheme.buttonwhite, AppColors.primaryblue, null, () {
                returnItem(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
