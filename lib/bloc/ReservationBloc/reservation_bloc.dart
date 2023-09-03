import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_event.dart';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/Reservation.dart';
import '../../models/ReservationDetails.dart';
import '../../models/Status.dart';
import '../../services/callApi.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(const ReservationState()) {
    on<AddReservations>(_onAddReservation);
    on<UpdateReservationDetailStatus>(_onUpdateReservationDetailStatus);
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
      // Update the existing reservation (this is just an example, you can do it in your own way)
      for (var i = 0; i < updatedReservationsList.length; i++) {
        if (updatedReservationsList[i].userId == event.reservation.userId) {
          // Check if reservationDetails from both instances are not null
          if (updatedReservationsList[i].reservationDetails != null &&
              event.reservation.reservationDetails != null) {
            updatedReservationsList[i]
                .reservationDetails!
                .addAll(event.reservation.reservationDetails!);
          }
          // If the existing reservationDetails is null but the new one is not, assign it
          else if (updatedReservationsList[i].reservationDetails == null &&
              event.reservation.reservationDetails != null) {
            updatedReservationsList[i].reservationDetails =
                event.reservation.reservationDetails;
          }
          break;
        }
      }
    } else {
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
  // Get the current state
  final state = this.state;

  // Copy the existing list of reservations
  List<Reservation> updatedReservationsList = List.from(state.reservationsList);

  // Find the reservation to be updated and update it
  for (var i = 0; i < updatedReservationsList.length; i++) {
    if (updatedReservationsList[i].id == event.reservation.id) {
      updatedReservationsList[i] = event.reservation;
      break;
    }
  }

  // Emit the new state with the updated list of reservations
  emit(ReservationState(reservationsList: updatedReservationsList));
}


  FutureOr _onUpdateReservationDetailStatus(
    UpdateReservationDetailStatus event, Emitter emit) async {
  List<Reservation> reservationsList = List.from(state.reservationsList);
  
  // Find the user's reservation
  Reservation? userReservation = reservationsList.firstWhere(
      (reservation) => reservation.userId == event.userId,
      );

  if (userReservation != null && userReservation.reservationDetails != null) {
    // Clone the user's reservation
    Reservation updatedReservation = Reservation(
      id: userReservation.id,
      userId: userReservation.userId,
      reservationDetails: List.from(userReservation.reservationDetails!),
    );
    
    // Find the reservation detail to update
    ReservationDetails? detailToUpdate = updatedReservation.reservationDetails!
        .firstWhere((detail) => detail.id == event.reservationDetailId,
            );

    if (detailToUpdate != null) {
      // Update the status of the reservation detail
      detailToUpdate = detailToUpdate.copyWith(
        status: event.status, // replace with desired status
      );
      
      // Replace the old detail with the updated one
      int indexToUpdate = updatedReservation.reservationDetails!
          .indexWhere((detail) => detail.id == detailToUpdate!.id);
      updatedReservation.reservationDetails![indexToUpdate] = detailToUpdate;

      // Replace the old reservation with the updated one in the reservationsList
      int reservationIndexToUpdate = reservationsList
          .indexWhere((reservation) => reservation.id == updatedReservation.id);
      reservationsList[reservationIndexToUpdate] = updatedReservation;

      // Emit the new state with updated reservationsList
      emit(ReservationState(reservationsList: reservationsList));
    } else {
      // Emit a state indicating the reservation detail was not found
      print('Reservation detail not found');
    }
  } else {
    // Emit a state indicating the user reservation was not found
    print('User reservation not found');
  }
}

}
