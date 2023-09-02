import 'package:flutter/cupertino.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_bloc.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_event.dart';

import '../bloc/bloc_export.dart';
import '../models/Reservation.dart';
import '../widget/widget_alertbox.dart';

class ReservationServices {
  static Future<void> SaveRegistration(
      BuildContext context, Reservation reservation) async {
    ReservationBloc reservationBloc = BlocProvider.of<ReservationBloc>(context);
    reservationBloc.add(AddReservations(reservation: reservation));
    
   AlertBox.alertbox(
          context, "Reservation", "Equipement Reserve avec sucess!!", () {});
  }

}
