// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EquipmentCategories {
  final int id;
  final String name;
  String? releaseDateDesc;
  String? directors;
  String? desc;
  String? imageUrl;
  String? bannerUrl;
  String? trailerImg1;
  String? secondImg;
  String? secondText;
  EquipmentCategories({
    required this.id,
    required this.name,
    this.releaseDateDesc,
    this.directors,
    this.desc,
    this.imageUrl,
    this.bannerUrl,
    this.trailerImg1,
    this.secondImg,
    this.secondText,
  });

  EquipmentCategories copyWith({
    int? id,
    String? name,
    String? releaseDateDesc,
    String? directors,
    String? desc,
    String? imageUrl,
    String? bannerUrl,
    String? trailerImg1,
    String? secondImg,
    String? secondText,
  }) {
    return EquipmentCategories(
      id: id ?? this.id,
      name: name ?? this.name,
      releaseDateDesc: releaseDateDesc ?? this.releaseDateDesc,
      directors: directors ?? this.directors,
      desc: desc ?? this.desc,
      imageUrl: imageUrl ?? this.imageUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      trailerImg1: trailerImg1 ?? this.trailerImg1,
      secondImg: secondImg ?? this.secondImg,
      secondText: secondText ?? this.secondText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'releaseDateDesc': releaseDateDesc,
      'directors': directors,
      'desc': desc,
      'imageUrl': imageUrl,
      'bannerUrl': bannerUrl,
      'trailerImg1': trailerImg1,
      'secondImg': secondImg,
      'secondText': secondText,
    };
  }

  factory EquipmentCategories.fromMap(Map<String, dynamic> map) {
    return EquipmentCategories(
      id: map['id'] as int,
      name: map['name'] as String,
      releaseDateDesc: map['releaseDateDesc'] != null
          ? map['releaseDateDesc'] as String
          : null,
      directors: map['directors'] != null ? map['directors'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      bannerUrl: map['bannerUrl'] != null ? map['bannerUrl'] as String : null,
      trailerImg1:
          map['trailerImg1'] != null ? map['trailerImg1'] as String : null,
      secondImg: map['secondImg'] != null ? map['secondImg'] as String : null,
      secondText:
          map['secondText'] != null ? map['secondText'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipmentCategories.fromJson(String source) =>
      EquipmentCategories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EquipmentCategories(id: $id, name: $name, releaseDateDesc: $releaseDateDesc, directors: $directors, desc: $desc, imageUrl: $imageUrl, bannerUrl: $bannerUrl, trailerImg1: $trailerImg1, secondImg: $secondImg, secondText: $secondText)';
  }

  @override
  bool operator ==(covariant EquipmentCategories other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.releaseDateDesc == releaseDateDesc &&
        other.directors == directors &&
        other.desc == desc &&
        other.imageUrl == imageUrl &&
        other.bannerUrl == bannerUrl &&
        other.trailerImg1 == trailerImg1 &&
        other.secondImg == secondImg &&
        other.secondText == secondText;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        releaseDateDesc.hashCode ^
        directors.hashCode ^
        desc.hashCode ^
        imageUrl.hashCode ^
        bannerUrl.hashCode ^
        trailerImg1.hashCode ^
        secondImg.hashCode ^
        secondText.hashCode;
  }
}