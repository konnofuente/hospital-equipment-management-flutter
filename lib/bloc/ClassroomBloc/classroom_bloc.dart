import 'dart:async';
import 'dart:convert';
import 'package:evaltech_mobile/bloc/ClassroomBloc/classroom_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/ClassRoom.dart';

import '../../services/callApi.dart';
import 'Classroom_state.dart';
import 'package:http/http.dart' as http;

class ClassroomBloc extends Bloc<ClassroomEvent, ClassroomState> {
  ClassroomBloc() : super(const ClassroomState()) {
    on<AddClassrooms>(_onAddClassroom);
    on<UpdateClassrooms>(_onUpdateClassroom);
    on<DeleteClassrooms>(_onDeleteClassroom);
    on<FetchClassrooms>(_onFetchClassroom);
  }

  Future<FutureOr<void>> _onAddClassroom(
      AddClassrooms event, Emitter<ClassroomState> emit) async {
    final state = this.state;
    emit(ClassroomState(allClassrooms: event.Classrooms));

    // final item = Classroom(
    //     // id: event.Classrooms.id,
    //     // firstName: event.Classrooms.firstName,
    //     id:event.Classrooms.id,
    //     name: event.Classrooms.name,
    //     );

    try {
      print('Succesfully save of Classroom!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('OMline Classroom not created: $e !!!!!!!!!!!');
    }
  }

  Future<void> _onUpdateClassroom(
      UpdateClassrooms event, Emitter<ClassroomState> emit) async {
    final state = this.state;
    final classroom = event.Classrooms;
    final index = state.allClassrooms.indexOf(classroom);
    //update Locale storage
    List<Classroom> allClassroom = List.from(state.allClassrooms)
      ..remove(Classroom);
    allClassroom.insert(index, classroom.copyWith());
  }

  FutureOr<void> _onDeleteClassroom(
      DeleteClassrooms event, Emitter<ClassroomState> emit) {}

  Future<void> _onFetchClassroom(
      FetchClassrooms event, Emitter<ClassroomState> emit) async {
    final state = this.state;
    final response =
        // await http.get(Uri.parse('http://31.187.76.34:8090/classrooms'));
        await CallApi().getData('classrooms');

    if (response.statusCode == 200) {
      final List<dynamic> classroomsJson = json.decode(response.body);
      emit(ClassroomState(
          allClassrooms: classroomsJson
              .map((json) => Classroom.fromJson(jsonEncode(json)))
              .toList()));
      print("successfull fetch of all Classroom!!!!!!");
    } else {
      throw Exception('Failed to load classrooms');
    }
  }
}
