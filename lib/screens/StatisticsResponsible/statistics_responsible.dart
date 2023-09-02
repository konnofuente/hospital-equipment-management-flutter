import 'package:flutter/material.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_bloc.dart';
import '../../Theme/theme_export.dart';
import '../../bloc/bloc_export.dart';
import '../../models/Reservation.dart';
import '../../models/ReservationDetails.dart';
import 'package:intl/intl.dart';

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
  List<ReservationDetails> reservedItems = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getStatistics(context);
  }

  void _getStatistics(BuildContext context) {
    EquipmentCategoriesBloc equipmentCategoriesBloc =
        BlocProvider.of<EquipmentCategoriesBloc>(context);
    reservedItems = getReservationsForClient(context, widget.UserId)!;
    totalreservation = reservedItems.length;

    print(totalreservation);
    print(reservedItems);
  }

  // rest of your code...

  // Function to fetch reservations for a specific client
  List<ReservationDetails>? getReservationsForClient(
      BuildContext context, int UserId) {
    ReservationBloc reservationBloc = BlocProvider.of<ReservationBloc>(context);
    List<Reservation> stateReservation =
        List.from(reservationBloc.state.reservationsList);

    //   for (var i = 0; i < stateReservation.length; i++) {
    // if (stateReservation[i].userId == UserId) {
    //   // Check if reservationDetails from both instances are not null
    // }

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
                  _buildStatCard(
                    'Total Loan',
                    '$totalreservation',
                    Colors.blue,
                  ),
                  SizedBox(height: 20),

                  // Total Number of Items
                  _buildStatCard(
                    'Total Loan',
                    '$totalItems',
                    Colors.green,
                  ),
                  SizedBox(height: 20),

                  Text(
                    'Reserved Items',
                    style: AppTextTheme.title,
                  ),
                  SizedBox(height: 10),
                  reservedItems.isEmpty
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
                          child: ListView.builder(
                            itemCount: reservedItems.length,
                            itemBuilder: (context, index) {
                              final item = reservedItems[index];
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.check_box_outline_blank,
                                        size: 24.0, color: Colors.blue),
                                    SizedBox(width: 16.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.equipmentItemId.toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Quantity: ${item.reservedQuantity}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Return Date: ${DateFormat('dd-MM-yyyy').format(item.returnDate)}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ])));
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
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
    );
  }
}
