// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EquipmentItem {
  final String id;
  final String name;
  final String description;
  final int quantity;

  EquipmentItem({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
  });

 

  EquipmentItem copyWith({
    String? id,
    String? name,
    String? description,
    int? quantity,
  }) {
    return EquipmentItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'quantity': quantity,
    };
  }

  factory EquipmentItem.fromMap(Map<String, dynamic> map) {
    return EquipmentItem(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipmentItem.fromJson(String source) => EquipmentItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EquipmentItem(id: $id, name: $name, description: $description, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant EquipmentItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      quantity.hashCode;
  }
}
