import 'package:flutter/cupertino.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_bloc.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_event.dart';
import 'package:provider/provider.dart';

import '../bloc/bloc_export.dart';
import '../models/Reservation.dart';
import '../models/ReservationDetails.dart';
import '../models/Status.dart';
import '../models/User.dart';
import '../provider/provider.dart';
import '../widget/widget_alertbox.dart';

class ReservationServices {
  static Future<void> SaveReservation(
      BuildContext context, Reservation reservation) async {
    ReservationBloc reservationBloc = BlocProvider.of<ReservationBloc>(context);
    reservationBloc.add(AddReservations(reservation: reservation));

    AlertBox.alertbox(
        context, "Reservation", "Equipement Reserve avec sucess!!", () {});
  }

  static Future<void> changeReservationStatus(
      BuildContext context, int reservationDetailId, Status state) async {
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
          reservationDetailId: reservationDetailId,
          status: state));
    });
  }

  // To get all reservation details with the status PENDINGRESERVE
  List<ReservationDetails> getPendingReserveDetails(
      List<Reservation> reservationsList) {
    List<ReservationDetails> pendingReserveDetails = [];
    for (var reservation in reservationsList) {
      for (var detail in reservation.reservationDetails!) {
        if (detail.status == Status.PENDINGRESERVE) {
          pendingReserveDetails.add(detail);
        }
      }
    }
    return pendingReserveDetails;
  }

// To get all reservation details with the status PENDINGRETURN
  List<ReservationDetails> getPendingReturnDetails(
      List<Reservation> reservationsList) {
    List<ReservationDetails> pendingReturnDetails = [];
    for (var reservation in reservationsList) {
      for (var detail in reservation.reservationDetails!) {
        if (detail.status == Status.PENDINGRETURN) {
          pendingReturnDetails.add(detail);
        }
      }
    }
    return pendingReturnDetails;
  }

// To get all reservation details with the status RESERVE
  List<ReservationDetails> getReserveDetails(
      List<Reservation> reservationsList) {
    List<ReservationDetails> reserveDetails = [];
    for (var reservation in reservationsList) {
      for (var detail in reservation.reservationDetails!) {
        if (detail.status == Status.RESERVE) {
          reserveDetails.add(detail);
        }
      }
    }
    return reserveDetails;
  }

// To get all reservation details with the status RETURN
  List<ReservationDetails> getReturnDetails(
      List<Reservation> reservationsList) {
    List<ReservationDetails> returnDetails = [];
    for (var reservation in reservationsList) {
      for (var detail in reservation.reservationDetails!) {
        if (detail.status == Status.RETURN) {
          returnDetails.add(detail);
        }
      }
    }
    return returnDetails;
  }
}
