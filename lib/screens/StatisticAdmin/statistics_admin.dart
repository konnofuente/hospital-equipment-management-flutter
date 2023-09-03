import 'package:flutter/material.dart';
import 'package:gestion_hopital/components/reservation_detail_list.dart';
import 'package:gestion_hopital/models/ReservationDetails.dart';
import 'package:gestion_hopital/services/reservationService.dart';
import 'package:gestion_hopital/utils/navigate_screen.dart';
import 'package:gestion_hopital/widget/widget_export.dart';

import '../../bloc/EquipementCategoriesBloc/equipement_categories_bloc.dart';
import '../../bloc/ReservationBloc/reservation_bloc.dart';
import '../../bloc/bloc_export.dart';
import '../../models/Reservation.dart';
import '../ReservationListScreen/reservation_list_screen.dart';

class StatisticAdminScreen extends StatefulWidget {
  StatisticAdminScreen();

  @override
  State<StatisticAdminScreen> createState() => _StatisticAdminScreenState();
}

class _StatisticAdminScreenState extends State<StatisticAdminScreen> {
  @override
  void initState() {
    _getStatistics(context);
    super.initState();
  }

  late int totalCategories = 0;
  // Replace with your own data
  int totalItems = 0;
  List<ReservationDetails> getPendingReserveDetails = [];
  List<ReservationDetails> getPendingReturnDetails = [];
  List<ReservationDetails> getReserveDetails = [];
  List<ReservationDetails> getReturnDetails = [];

  void _getStatistics(BuildContext context) {
    EquipmentCategoriesBloc equipmentCategoriesBloc =
        BlocProvider.of<EquipmentCategoriesBloc>(context);

    ReservationBloc reservationBloc = BlocProvider.of<ReservationBloc>(context);

    List<Reservation> reservationsList = reservationBloc.state.reservationsList;

    getPendingReserveDetails =
        ReservationServices().getPendingReserveDetails(reservationsList);
    getPendingReturnDetails =
        ReservationServices().getPendingReturnDetails(reservationsList);
    getReserveDetails =
        ReservationServices().getReserveDetails(reservationsList);
    getReturnDetails = ReservationServices().getReturnDetails(reservationsList);

    print("initialise of all reservation by status complete !!!!!!!!!!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Total Number of Categories
            Expanded(
              child: StatCard.NumberCard(
                'Equipement Reserve',
                '${getReserveDetails.length}',
                Colors.blue,
                () {
                  _getStatistics(context);
                  NavigationScreen.navigate(
                      context,
                      ReservationListScreen(
                          reservationDetailsList: getReserveDetails));
                },
              ),
            ),
            SizedBox(height: 20),

            // Total Number of Items
            Expanded(
              child: StatCard.NumberCard(
                'Demande de reservation',
                '${getPendingReserveDetails.length}',
                Colors.green,
                () {
                  _getStatistics(context);

                  // print(getPendingReserveDetails);
                  NavigationScreen.navigate(
                      context,
                      ReservationListScreen(
                          reservationDetailsList: getPendingReserveDetails));
                },
              ),
            ),
            SizedBox(height: 20),

            Expanded(
              child: StatCard.NumberCard(
                'Equipement Retourner',
                '${getPendingReturnDetails.length}',
                Colors.green,
                () {
                  _getStatistics(context);

                  NavigationScreen.navigate(
                      context,
                      ReservationListScreen(
                          reservationDetailsList: getPendingReturnDetails));
                },
              ),
            ),
            SizedBox(height: 20),
            // Other Stats here...
          ],
        ),
      ),
    );
  }
}
