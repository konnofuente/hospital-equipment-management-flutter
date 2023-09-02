import 'package:flutter/material.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_bloc.dart';

import '../../Theme/theme_export.dart';
import '../../bloc/EquipementCategoriesBloc/equipement_categories_bloc.dart';
import '../../bloc/bloc_export.dart';
import '../../models/Reservation.dart';
import '../../models/ReservationDetails.dart';

class StatisticResponsibleScreen extends StatefulWidget {
  final int UserId; // Add this
  StatisticResponsibleScreen({Key? key, required this.UserId})
      : super(key: key);

  @override
  State<StatisticResponsibleScreen> createState() =>
      _StatisticResponsibleScreenState();
}

class _StatisticResponsibleScreenState
    extends State<StatisticResponsibleScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getStatistics(context);
    });
  }

  late int totalCategories = 0;
  // Replace with your own data
  int totalItems = 0;
  List<ReservationDetails> reservedItems = [];

  void _getStatistics(BuildContext context) {
    EquipmentCategoriesBloc equipmentCategoriesBloc =
        BlocProvider.of<EquipmentCategoriesBloc>(context);
    totalCategories =
        equipmentCategoriesBloc.state.allEquipmentCategories.length;
    reservedItems = getReservationsForClient(context, widget.UserId)!;
    
    print(totalCategories);
  }

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
              '$totalCategories',
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
                        return ListTile(
                          leading: Icon(Icons.check_box_outline_blank),
                          title: Text(item.equipmentItemId.toString()),
                          subtitle: Text('Quantity: ${item.reservedQuantity}'),
                          trailing: Text(
                            'Return Date: ${item.returnDate}',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 150,
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
