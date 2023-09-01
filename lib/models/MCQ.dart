// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:collection/collection.dart';
import 'Exercise.dart';

class MCQ {
  final String serie;
  final String subject;
  final String classe;
  final List<Exercise> exercises;
  MCQ({
    required this.serie,
    required this.subject,
    required this.classe,
    required this.exercises,
  });

  MCQ copyWith({
    String? serie,
    String? subject,
    String? classe,
    List<Exercise>? exercises,
  }) {
    return MCQ(
      serie: serie ?? this.serie,
      subject: subject ?? this.subject,
      classe: classe ?? this.classe,
      exercises: exercises ?? this.exercises,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serie': serie,
      'subject': subject,
      'classe': classe,
      'exercises': exercises.map((x) => x.toMap()).toList(),
    };
  }

  factory MCQ.fromMap(Map<String, dynamic> map) {
    return MCQ(
      serie: map['serie'] as String,
      subject: map['subject'] as String,
      classe: map['classe'] as String,
      // exercises: List<Exercise>.from((map['exercises'] as List<int>).map<Exercise>((x) => Exercise.fromMap(x as Map<String,dynamic>),),),
      exercises: List<Exercise>.from((map['exercises'] as List<dynamic>).map<Exercise>((x) => Exercise.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MCQ.fromJson(String source) => MCQ.fromMap(json.decode(source) as Map<String, Object>);

  @override
  String toString() {
    return 'MCQ(serie: $serie, subject: $subject, classe: $classe, exercises: $exercises)';
  }

  @override
  bool operator ==(covariant MCQ other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.serie == serie &&
      other.subject == subject &&
      other.classe == classe &&
      listEquals(other.exercises, exercises);
  }

  @override
  int get hashCode {
    return serie.hashCode ^
      subject.hashCode ^
      classe.hashCode ^
      exercises.hashCode;
  }
}
