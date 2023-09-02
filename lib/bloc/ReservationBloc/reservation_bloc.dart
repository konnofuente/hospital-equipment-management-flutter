import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_event.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_state.dart';
import 'package:gestion_hopital/models/function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../models/Reservation.dart';
import '../../provider/provider.dart';
import '../../screens/Home/GetStarted/getStarted_screen.dart';
import '../../services/callApi.dart';
import '../../utils/navigate_screen.dart';
import '../../widget/widget_alertbox.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(const ReservationState()) {
    on<AddReservations>(_onAddReservation);
    on<UpdateReservations>(_onUpdateReservation);
  }

  final loginStatusController = StreamController<bool>.broadcast();
  final _storage = const FlutterSecureStorage();

  Future<FutureOr<void>> _onFetchReservationInfo(
      FetchReservationsInfo event, Emitter<ReservationState> emit) async {
    final state = this.state;
    final response = await CallApi().getDataWithID('Reservations', 1);

    if (response.statusCode == 200) {
      final Map<String, dynamic> ReservationData = jsonDecode(response.body);
      emit(ReservationState(
          appReservation: Reservation.fromMap(ReservationData)));
      print("successfull fetch of all Reservation!!!!!!");
      print(state.appReservation);
    } else {
      throw Exception('Failed to load Reservations');
    }
  }

  bool doesUserReservationExist(
      int userId, List<Reservation> reservationsList) {
    return reservationsList.any((reservation) => reservation.userId == userId);
  }

  Future<void> _onAddReservation(
      AddReservations event, Emitter<ReservationState> emit) async {
    final state = this.state;
    List<Reservation> updatedReservationsList =
        List.from(state.reservationsList);

    if (doesUserReservationExist(
        event.reservation.userId, state.reservationsList)) {
    print("reservation already existe");
      // The user already has an existing reservation.
      // Update the existing reservation (this is just an example, you can do it in your own way)
for (var i = 0; i < updatedReservationsList.length; i++) {
  if (updatedReservationsList[i].userId == event.reservation.userId) {
    // Check if reservationDetails from both instances are not null
    if (updatedReservationsList[i].reservationDetails != null && event.reservation.reservationDetails != null) {
      updatedReservationsList[i].reservationDetails!.addAll(event.reservation.reservationDetails!);
    }
    // If the existing reservationDetails is null but the new one is not, assign it
    else if (updatedReservationsList[i].reservationDetails == null && event.reservation.reservationDetails != null) {
      updatedReservationsList[i].reservationDetails = event.reservation.reservationDetails;
    }
    break;
  }
}


    } else {
      // The user doesn't have an existing reservation.
      // Add the new reservation to the list.
      updatedReservationsList.add(event.reservation);
    }

    // Emit the new state
    emit(ReservationState(reservationsList: updatedReservationsList));
    print(updatedReservationsList);

    try {
      print(state.reservationsList);
    } catch (e) {
      // Handle exception, maybe emit a failure state or log the error
      print("An error occurred: $e");
    }
  }

  Future<void> _onUpdateReservation(
      UpdateReservations event, Emitter<ReservationState> emit) async {
    // final state = this.state;
    // final Reservation = event.reservation;
    // final index = state.appReservation.indexOf(Reservation);
    // //update Locale storage
    // List<Reservation> allReservation = List.from(state.appReservation)..remove(Reservation);
    // allReservation.insert(
    //     index, Reservation.copyWith());
  }
}
