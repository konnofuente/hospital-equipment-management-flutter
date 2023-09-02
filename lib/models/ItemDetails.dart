// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemDetails {
  final int id;
  final int equipmentItemId;
  final int availableQuantity;
  final int totalQuantity;

  ItemDetails({
    required this.id,
    required this.equipmentItemId,
    required this.availableQuantity,
    required this.totalQuantity,
  });

  ItemDetails copyWith({
    int? id,
    int? equipmentItemId,
    int? availableQuantity,
    int? totalQuantity,
  }) {
    return ItemDetails(
      id: id ?? this.id,
      equipmentItemId: equipmentItemId ?? this.equipmentItemId,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      totalQuantity: totalQuantity ?? this.totalQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'equipmentItemId': equipmentItemId,
      'availableQuantity': availableQuantity,
      'totalQuantity': totalQuantity,
    };
  }

  factory ItemDetails.fromMap(Map<String, dynamic> map) {
    return ItemDetails(
      id: map['id'] as int,
      equipmentItemId: map['equipmentItemId'] as int,
      availableQuantity: map['availableQuantity'] as int,
      totalQuantity: map['totalQuantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemDetails.fromJson(String source) => ItemDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemDetails(id: $id, equipmentItemId: $equipmentItemId, availableQuantity: $availableQuantity, totalQuantity: $totalQuantity)';
  }

  @override
  bool operator ==(covariant ItemDetails other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.equipmentItemId == equipmentItemId &&
      other.availableQuantity == availableQuantity &&
      other.totalQuantity == totalQuantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      equipmentItemId.hashCode ^
      availableQuantity.hashCode ^
      totalQuantity.hashCode;
  }
}
