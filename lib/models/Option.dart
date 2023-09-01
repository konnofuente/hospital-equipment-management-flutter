// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Option {
  final int id;
  final String code;
  final String description;
  Option({
    required this.id,
    required this.code,
    required this.description,
  });

  Option copyWith({
    int? id,
    String? code,
    String? description,
  }) {
    return Option(
      id: id ?? this.id,
      code: code ?? this.code,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'description': description,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      id: map['id'] as int,
      code: map['code'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) => Option.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Option(id: $id, code: $code, description: $description)';

  @override
  bool operator ==(covariant Option other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.code == code &&
      other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ code.hashCode ^ description.hashCode;
}
