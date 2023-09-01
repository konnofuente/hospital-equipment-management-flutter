// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'Answer.dart';

class Exercise {
  final String question;
  final List<Answer> answers;
  Exercise({
    required this.question,
    required this.answers,
  });
  

  Exercise copyWith({
    String? question,
    List<Answer>? answers,
  }) {
    return Exercise(
      question: question ?? this.question,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      // 'answers': answers.map((x) => x.toMap()).toList(),
      'answers': List<dynamic>.from(answers.map((x) => x.toMap())),
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      question: map['question'] as String,
      // answers: List<Answer>.from((map['answers'] as List<int>).map<Answer>((x) => Answer.fromMap(x as Map<String,dynamic>),),),
      answers: List<Answer>.from((map['answers'] as List<dynamic>).map<Answer>((x) => Answer.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercise.fromJson(String source) => Exercise.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Exercise(question: $question, answers: $answers)';

  @override
  bool operator ==(covariant Exercise other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.question == question &&
      listEquals(other.answers, answers);
  }

  @override
  int get hashCode => question.hashCode ^ answers.hashCode;
}
