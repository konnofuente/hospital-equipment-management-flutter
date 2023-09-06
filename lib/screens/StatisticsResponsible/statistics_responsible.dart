import 'package:flutter/material.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_bloc.dart';
import 'package:gestion_hopital/widget/widget_buildStatCard.dart';
import '../../Theme/theme_export.dart';
import '../../bloc/bloc_export.dart';
import '../../models/Reservation.dart';
import '../../models/ReservationDetails.dart';

import '../../components/reservation_detail_list.dart';

class StatisticResponsibleScreen extends StatefulWidget {
  final int UserId; // Add this
  StatisticResponsibleScreen({Key? key, required this.UserId})
      : super(key: key);

  @override
  State<StatisticResponsibleScreen> createState() =>
      _StatisticResponsibleScreenState();
}

class _StatisticResponsibleScreenState extends State<StatisticResponsibleScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late int totalreservation = 0;
  int totalItems = 0;
  List<ReservationDetails> reserveDetailList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getStatistics(context);
  }

  void _getStatistics(BuildContext context) {
    EquipmentCategoriesBloc equipmentCategoriesBloc =
        BlocProvider.of<EquipmentCategoriesBloc>(context);
    reserveDetailList = getReservationsForClient(context, widget.UserId)!;
    totalreservation = reserveDetailList.length;

    print(totalreservation);
    print(reserveDetailList);
  }

  // rest of your code...

  // Function to fetch reservations for a specific client
  List<ReservationDetails>? getReservationsForClient(
      BuildContext context, int UserId) {
    ReservationBloc reservationBloc = BlocProvider.of<ReservationBloc>(context);
    List<Reservation> stateReservation =
        List.from(reservationBloc.state.reservationsList);
    for (var reservation in stateReservation) {
      if (reservation.userId == UserId) {
        return reservation.reservationDetails;
      }
    }
    return [];
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
                  StatCard.NumberCard(
                    'Nombre Total de demande d Equipement',
                    '$totalreservation',
                    Colors.blue,
                    null,
                  ),
                  SizedBox(height: 20),

                  // Total Number of Items
               
                  SizedBox(height: 20),

                  Text(
                    'Reserved Items',
                    style: AppTextTheme.title,
                  ),
                  SizedBox(height: 10),
                  reserveDetailList.isEmpty
                      ? Center(
                          child: Text(
                            'No reservation made',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        )
                      : Expanded(
                          child: ReservationDetailList(reserveDetailList: reserveDetailList),
                        ),
                ])));
  }
}
