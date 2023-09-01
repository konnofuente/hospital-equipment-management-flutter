import 'package:equatable/equatable.dart';
import '../../models/ClassRoom.dart';

class ClassroomState extends Equatable {
  final List<Classroom> allClassrooms;
  const ClassroomState(
  {this.allClassrooms = const <Classroom>[],});

  @override
  List<Object> get props => [allClassrooms];
}

