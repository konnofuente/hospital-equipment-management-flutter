// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'ItemDetails.dart';

class EquipmentItem {
  final int id;
  final int EquipementCategoryID;
  final String name;
  final String description;
  final List<ItemDetails> itemDetails;
  EquipmentItem({
    required this.id,
    required this.EquipementCategoryID,
    required this.name,
    required this.description,
    required this.itemDetails,
  });
  

  EquipmentItem copyWith({
    int? id,
    int? EquipementCategoryID,
    String? name,
    String? description,
    List<ItemDetails>? itemDetails,
  }) {
    return EquipmentItem(
      id: id ?? this.id,
      EquipementCategoryID: EquipementCategoryID ?? this.EquipementCategoryID,
      name: name ?? this.name,
      description: description ?? this.description,
      itemDetails: itemDetails ?? this.itemDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'EquipementCategoryID': EquipementCategoryID,
      'name': name,
      'description': description,
      'itemDetails': itemDetails.map((x) => x.toMap()).toList(),
    };
  }

  factory EquipmentItem.fromMap(Map<String, dynamic> map) {
    return EquipmentItem(
      id: map['id'] as int,
      EquipementCategoryID: map['EquipementCategoryID'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      itemDetails: List<ItemDetails>.from((map['itemDetails'] as List<int>).map<ItemDetails>((x) => ItemDetails.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipmentItem.fromJson(String source) => EquipmentItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EquipmentItem(id: $id, EquipementCategoryID: $EquipementCategoryID, name: $name, description: $description, itemDetails: $itemDetails)';
  }

  @override
  bool operator ==(covariant EquipmentItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.EquipementCategoryID == EquipementCategoryID &&
      other.name == name &&
      other.description == description &&
      listEquals(other.itemDetails, itemDetails);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      EquipementCategoryID.hashCode ^
      name.hashCode ^
      description.hashCode ^
      itemDetails.hashCode;
  }
}
