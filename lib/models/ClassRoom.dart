// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Classroom {
  final int id;
  final String name;
  String? category;
  String? releaseDate;
  String? releaseDateDesc;
  String? directors;
  String? runtime;
  String? desc;
  double? rating;
  String? imageUrl;
  String? bannerUrl;
  String? trailerImg1;
  String? quizImg;
  String? quizText;
  
  Classroom({
    required this.id,
    required this.name,
    this.category,
    this.releaseDate,
    this.releaseDateDesc,
    this.directors,
    this.runtime,
    this.desc,
    this.rating,
    this.imageUrl,
    this.bannerUrl,
    this.trailerImg1,
    this.quizImg,
    this.quizText,
  });


  Classroom copyWith({
    int? id,
    String? name,
  }) {
    return Classroom(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Classroom.fromMap(Map<String, dynamic> map) {
    return Classroom(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Classroom.fromJson(String source) => Classroom.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Classroom(id: $id, name: $name)';

  @override
  bool operator ==(covariant Classroom other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
