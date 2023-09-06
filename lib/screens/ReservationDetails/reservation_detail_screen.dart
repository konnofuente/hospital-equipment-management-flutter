// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gestion_hopital/Theme/theme_export.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_bloc.dart';
import 'package:gestion_hopital/bloc/bloc_export.dart';
import 'package:gestion_hopital/models/ReservationDetails.dart';
import 'package:gestion_hopital/models/Role.dart';
import 'package:gestion_hopital/models/Status.dart';
import 'package:gestion_hopital/provider/provider.dart';
import 'package:gestion_hopital/widget/widget_export.dart';
import 'package:provider/provider.dart';
import '../../bloc/ReservationBloc/reservation_event.dart';
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
  @override
  void initState() {
    actualUser =
        Provider.of<UserManagement>(context, listen: false).actaulUser!;
    super.initState();
  }

  DateTime? loanDate;
  DateTime? returnDate;
  TextEditingController quantityController = TextEditingController();
  final TextEditingController reserveDateController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();
    TextEditingController commentairecontroller = TextEditingController();
  late User actualUser;

  void returnItem(BuildContext context, Status state, String alertMessage) {
    AlertBox.awesomeOkBox(context, "Reservation", alertMessage, () {
      // widget.Item.

      ReservationBloc reservationBloc =
          BlocProvider.of<ReservationBloc>(context);
      reservationBloc.add(UpdateReservationDetailStatus(
          userId: actualUser.id!,
          reservationDetailId: widget.Item.id,
          status: state));
    });
  }

  Widget buildButton(String title, Color buttonColor, Status status) {
    return actualUser.role == Role.ADMIN.name
        ? WidgetButton.largeButton(
            title, AppTextTheme.buttonwhite, buttonColor, null, () {
            returnItem(context, status, "Vous aller ${title}");
          })
        : Container();
  }

  Widget spacer() => SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item'),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryblue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // Display item information with Card
            StatCard.ReservationInfoCard(
                widget.Item.id.toString(),
                widget.Item.equipmentItemId.toString(),
                // widget.Item.reservedQuantity.toString(),
                widget.Item.returnDate.toString(),
                widget.Item.returnDate.toString()),

            SizedBox(height: 20),

            // // actualUser.role == Role.RESPONSABLE.name ?
            //     WidgetButton.largeButton("Retourne l'equipement", AppTextTheme.buttonwhite, AppColors.primaryblue,
            //         Status.PENDINGRETURN , null ),
            //         // :
            //     // spacer(),

            actualUser.role == Role.RESPONSABLE.name ? 
            WidgetTextForm.getTextField("Commentaire", commentairecontroller, TextInputType.text , "entre commentaire", WidgetIcon.description(false) ): Container(),

            SizedBox(height: 10,),
            actualUser.role == Role.RESPONSABLE.name
                ? WidgetButton.largeButton("Retourne l'equipement",
                    AppTextTheme.buttonwhite, AppColors.primaryblue, null, () {
                    AlertBox.awesomeOkBox(context, "Reservation",
                        "Vous aller retourner cette equipement", () {});
                    // widget.Item.

                    ReservationBloc reservationBloc =
                        BlocProvider.of<ReservationBloc>(context);
                    reservationBloc.add(UpdateReservationDetailStatus(
                        userId: actualUser.id!,
                        reservationDetailId: widget.Item.id,
                        status: Status.RETURN));
                  })
                : Container(),

            if (actualUser.role == Role.ADMIN.name) ...[
              buildButton(
                  "Valider La reservation", AppColors.success, Status.RESERVE),
              spacer(),
              buildButton(
                  "Confirme le retour", AppColors.primaryblue, Status.RETURN),
              spacer(),
              buildButton(
                  "Rejeter la reservation", AppColors.danger, Status.RETURN),
            ]
          ]),
        ),
      ),
    );
  }
}
