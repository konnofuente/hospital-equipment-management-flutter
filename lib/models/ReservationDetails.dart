// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReservationDetails {
  final int id;
  final int reservationId;
  final int equipmentItemId;
  final int reservedQuantity;
  final DateTime reserveDate;
  final DateTime returnDate;

  ReservationDetails({
    required this.id,
    required this.reservationId,
    required this.equipmentItemId,
    required this.reservedQuantity,
    required this.reserveDate,
    required this.returnDate,
  });

  ReservationDetails copyWith({
    int? id,
    int? reservationId,
    int? equipmentItemId,
    int? reservedQuantity,
    DateTime? reserveDate,
    DateTime? returnDate,
  }) {
    return ReservationDetails(
      id: id ?? this.id,
      reservationId: reservationId ?? this.reservationId,
      equipmentItemId: equipmentItemId ?? this.equipmentItemId,
      reservedQuantity: reservedQuantity ?? this.reservedQuantity,
      reserveDate: reserveDate ?? this.reserveDate,
      returnDate: returnDate ?? this.returnDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'reservationId': reservationId,
      'equipmentItemId': equipmentItemId,
      'reservedQuantity': reservedQuantity,
      'reserveDate': reserveDate.millisecondsSinceEpoch,
      'returnDate': returnDate.millisecondsSinceEpoch,
    };
  }

  factory ReservationDetails.fromMap(Map<String, dynamic> map) {
    return ReservationDetails(
      id: map['id'] as int,
      reservationId: map['reservationId'] as int,
      equipmentItemId: map['equipmentItemId'] as int,
      reservedQuantity: map['reservedQuantity'] as int,
      reserveDate: DateTime.fromMillisecondsSinceEpoch(map['reserveDate'] as int),
      returnDate: DateTime.fromMillisecondsSinceEpoch(map['returnDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationDetails.fromJson(String source) => ReservationDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReservationDetails(id: $id, reservationId: $reservationId, equipmentItemId: $equipmentItemId, reservedQuantity: $reservedQuantity, reserveDate: $reserveDate, returnDate: $returnDate)';
  }

  @override
  bool operator ==(covariant ReservationDetails other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.reservationId == reservationId &&
      other.equipmentItemId == equipmentItemId &&
      other.reservedQuantity == reservedQuantity &&
      other.reserveDate == reserveDate &&
      other.returnDate == returnDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      reservationId.hashCode ^
      equipmentItemId.hashCode ^
      reservedQuantity.hashCode ^
      reserveDate.hashCode ^
      returnDate.hashCode;
  }
}
