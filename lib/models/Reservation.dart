// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'ReservationDetails.dart';

class Reservation {
  final int id;
  final int userId;
  late final List<ReservationDetails>? reservationDetails;
  Reservation({
    required this.id,
    required this.userId,
    this.reservationDetails,
  });

  Reservation copyWith({
    int? id,
    int? userId,
    List<ReservationDetails>? reservationDetails,
  }) {
    return Reservation(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      reservationDetails: reservationDetails ?? this.reservationDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'reservationDetails': reservationDetails!.map((x) => x.toMap()).toList(),
    };
  }

  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      id: map['id'] as int,
      userId: map['userId'] as int,
      reservationDetails: List<ReservationDetails>.from((map['reservationDetails'] as List<int>).map<ReservationDetails>((x) => ReservationDetails.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Reservation.fromJson(String source) => Reservation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Reservation(id: $id, userId: $userId, reservationDetails: $reservationDetails)';

  @override
  bool operator ==(covariant Reservation other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      listEquals(other.reservationDetails, reservationDetails);
  }

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ reservationDetails.hashCode;
}
