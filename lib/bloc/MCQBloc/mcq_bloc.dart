import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:evaltech_mobile/models/MCQ.dart';
import 'package:evaltech_mobile/services/callApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'mcq_event.dart';
import 'mcq_state.dart';

class MCQBloc extends Bloc<MCQEvent, MCQState> {
  MCQBloc() : super(const MCQState()) {
    on<AddMCQs>(_onAddMCQ);
    on<FetchMCQs>(_onFetchMCQ);
  }

  FutureOr<void> _onAddMCQ(AddMCQs event, Emitter<MCQState> emit) {}

  Future<FutureOr<void>> _onFetchMCQ(
      FetchMCQs event, Emitter<MCQState> emit) async {
    final state = this.state;
    final response = await CallApi().getData("multipleChoiceQuestions");
    // print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // print(response.body);
      emit(MCQState(
          allMCQs: List<MCQ>.from(
              data.map((e) => MCQ.fromMap(e as Map<String, dynamic>)))));
      print("successfull fetch of all MCQ");
    } else {
      throw Exception('Failed to load mcqs!!!!!');
    }
  }
}
