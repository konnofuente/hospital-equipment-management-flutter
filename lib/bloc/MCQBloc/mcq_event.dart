
import 'package:equatable/equatable.dart';

import '../../models/MCQ.dart';

abstract class MCQEvent extends Equatable {
  const MCQEvent();

  @override
  List<Object> get props => [];
}

class AddMCQs extends MCQEvent {
  final List<MCQ> MCQs;
  const AddMCQs({
    required this.MCQs,
  });
  @override
  List<Object> get props => [MCQs];
}



class UpdateMCQs extends MCQEvent {
  final MCQ MCQs;
  const UpdateMCQs({
    required this.MCQs,
  });
  @override
  List<Object> get props => [MCQs];
}



class DeleteMCQs extends MCQEvent {
  final MCQ MCQs;
  const DeleteMCQs({
    required this.MCQs,
  });
  @override
  List<Object> get props => [MCQs];
}

class FetchMCQs extends MCQEvent {

}
class InitMCQs extends MCQEvent {

}


