import 'package:equatable/equatable.dart';
import '../../../models/Reservation.dart';

class ReservationState extends Equatable {
  final Reservation? appReservation;
  final List<Reservation> reservationsList; // Add this line
  
  const ReservationState({this.appReservation, this.reservationsList = const []}); // Update this line

  @override
  List<Object?> get props => [appReservation, reservationsList]; // Update this line
}


