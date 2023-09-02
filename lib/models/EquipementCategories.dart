// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'EquipementItem.dart';

class EquipmentCategories {
  int? id;
  final String name;
  List<EquipmentItem> items;
  String? releaseDateDesc;
  String? directors;
  String? desc;
  String? imageUrl;
  String? bannerUrl;
  EquipmentCategories({
    this.id,
    required this.name,
    required this.items,
    this.releaseDateDesc,
    this.directors,
    this.desc,
    this.imageUrl,
    this.bannerUrl,
  });


  EquipmentCategories copyWith({
    int? id,
    String? name,
    List<EquipmentItem>? items,
    String? releaseDateDesc,
    String? directors,
    String? desc,
    String? imageUrl,
    String? bannerUrl,
  }) {
    return EquipmentCategories(
      id: id ?? this.id,
      name: name ?? this.name,
      items: items ?? this.items,
      releaseDateDesc: releaseDateDesc ?? this.releaseDateDesc,
      directors: directors ?? this.directors,
      desc: desc ?? this.desc,
      imageUrl: imageUrl ?? this.imageUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'items': items.map((x) => x.toMap()).toList(),
      'releaseDateDesc': releaseDateDesc,
      'directors': directors,
      'desc': desc,
      'imageUrl': imageUrl,
      'bannerUrl': bannerUrl,
    };
  }

  factory EquipmentCategories.fromMap(Map<String, dynamic> map) {
    return EquipmentCategories(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      items: List<EquipmentItem>.from((map['items'] as List<int>).map<EquipmentItem>((x) => EquipmentItem.fromMap(x as Map<String,dynamic>),),),
      releaseDateDesc: map['releaseDateDesc'] != null ? map['releaseDateDesc'] as String : null,
      directors: map['directors'] != null ? map['directors'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      bannerUrl: map['bannerUrl'] != null ? map['bannerUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipmentCategories.fromJson(String source) => EquipmentCategories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EquipmentCategories(id: $id, name: $name, items: $items, releaseDateDesc: $releaseDateDesc, directors: $directors, desc: $desc, imageUrl: $imageUrl, bannerUrl: $bannerUrl)';
  }

  @override
  bool operator ==(covariant EquipmentCategories other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      listEquals(other.items, items) &&
      other.releaseDateDesc == releaseDateDesc &&
      other.directors == directors &&
      other.desc == desc &&
      other.imageUrl == imageUrl &&
      other.bannerUrl == bannerUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      items.hashCode ^
      releaseDateDesc.hashCode ^
      directors.hashCode ^
      desc.hashCode ^
      imageUrl.hashCode ^
      bannerUrl.hashCode;
  }
}
