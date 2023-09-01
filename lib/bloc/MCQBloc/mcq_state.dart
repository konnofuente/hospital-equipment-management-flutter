import 'package:equatable/equatable.dart';
import '../../models/MCQ.dart';

class MCQState extends Equatable {
  final List<MCQ> allMCQs;
  const MCQState(
  {this.allMCQs = const <MCQ>[],});

  @override
  List<Object> get props => [allMCQs];
}

