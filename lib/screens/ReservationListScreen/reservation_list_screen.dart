import 'package:gestion_hopital/models/ReservationDetails.dart';
import 'package:flutter/material.dart';
import '../../components/reservation_detail_list.dart';

class ReservationListScreen extends StatefulWidget {
  final List<ReservationDetails> reservationDetailsList;
  const ReservationListScreen({Key? key, required this.reservationDetailsList})
      : super(key: key);

  @override
  _ReservationListScreenState createState() => _ReservationListScreenState();
}

class _ReservationListScreenState extends State<ReservationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservation"),
        automaticallyImplyLeading: false,
      ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Total Number of Categories
                  SizedBox(height: 20),

        
                  SizedBox(height: 10),
                  widget.reservationDetailsList.isEmpty
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
                          child: ReservationDetailList( reserveDetailList: widget.reservationDetailsList),
                        ),
                ])));
  }
}
