
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_state.dart';

import '../../models/Reservation.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class AddReservations extends ReservationEvent {
  final Reservation reservation;
  const AddReservations({
    required this.reservation,
  });
  @override
  List<Object> get props => [reservation];
}

class FetchReservationsInfo extends ReservationEvent {}

class UpdateReservations extends ReservationEvent {
  final Reservation reservation;
  const UpdateReservations({
    required this.reservation,
  });
  @override
  List<Object> get props => [reservation];
}

class DeleteReservations extends ReservationEvent {
  final Reservation reservation;
  const DeleteReservations({
    required this.reservation,
  });
  @override
  List<Object> get props => [reservation];
}
