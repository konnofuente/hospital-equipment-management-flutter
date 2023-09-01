
import 'package:equatable/equatable.dart';

import '../../models/ClassRoom.dart';

abstract class ClassroomEvent extends Equatable {
  const ClassroomEvent();

  @override
  List<Object> get props => [];
}

class AddClassrooms extends ClassroomEvent {
  final List<Classroom> Classrooms;
  const AddClassrooms({
    required this.Classrooms,
  });
  @override
  List<Object> get props => [Classrooms];
}



class UpdateClassrooms extends ClassroomEvent {
  final Classroom Classrooms;
  const UpdateClassrooms({
    required this.Classrooms,
  });
  @override
  List<Object> get props => [Classrooms];
}



class DeleteClassrooms extends ClassroomEvent {
  final Classroom Classrooms;
  const DeleteClassrooms({
    required this.Classrooms,
  });
  @override
  List<Object> get props => [Classrooms];
}

class FetchClassrooms extends ClassroomEvent {
  // final Classroom Classrooms;
  // const FetchClassrooms({
  //   required this.Classrooms,
  // });
  // @override
  // List<Object> get props => [Classrooms];
}


