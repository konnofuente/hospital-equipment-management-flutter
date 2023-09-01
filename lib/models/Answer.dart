// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Answer {
  final String label;
  final bool  correct;

  Answer({
    required this.label,
    required this.correct,
  });


  Answer copyWith({
    String? label,
    bool? correct,
  }) {
    return Answer(
      label: label ?? this.label,
      correct: correct ?? this.correct,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'correct': correct,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      label: map['label'] as String,
      correct: map['correct'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Answer(label: $label, correct: $correct)';

  @override
  bool operator ==(covariant Answer other) {
    if (identical(this, other)) return true;
  
    return 
      other.label == label &&
      other.correct == correct;
  }

  @override
  int get hashCode => label.hashCode ^ correct.hashCode;
}
