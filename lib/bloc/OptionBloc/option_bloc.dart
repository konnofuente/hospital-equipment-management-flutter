import 'dart:async';
import 'dart:convert';
import 'package:gestion_hopital/bloc/OptionBloc/option_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/Option.dart';
import '../../models/Option.dart';
import 'Option_state.dart';
import 'package:http/http.dart' as http;

class OptionBloc extends Bloc<OptionEvent, OptionState> {
  OptionBloc() : super(const OptionState()) {
    on<AddOptions>(_onAddOption);
    on<UpdateOptions>(_onUpdateOption);
    on<DeleteOptions>(_onDeleteOption);
    on<FetchOptions>(_onFetchOption);
  }

  Future<FutureOr<void>> _onAddOption(
      AddOptions event, Emitter<OptionState> emit) async {
    final state = this.state;
    emit(OptionState(
        allOptions: List.from(state.allOptions)..add(event.Options)));

    final item = Option(
        // id: event.Options.id,
        // firstName: event.Options.firstName,
        id: event.Options.id,
        code: event.Options.code,
        description: event.Options.description);

    try {
      print('Succesfully save of Option!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('OMline Option not created: $e !!!!!!!!!!!');
    }
  }

  Future<void> _onUpdateOption(
      UpdateOptions event, Emitter<OptionState> emit) async {
    final state = this.state;
    final option = event.Options;
    final index = state.allOptions.indexOf(option);
    //update Locale storage
    List<Option> allOption = List.from(state.allOptions)..remove(Option);
    allOption.insert(index, option.copyWith());
  }

  FutureOr<void> _onDeleteOption(
      DeleteOptions event, Emitter<OptionState> emit) {}

  Future<FutureOr<void>> _onFetchOption(
      FetchOptions event, Emitter<OptionState> emit) async {
    final response =
        await http.get(Uri.parse('http://31.187.76.34:8090/options'));

    if (response.statusCode == 200) {
      final List<dynamic> optionJson = json.decode(response.body);
      emit(OptionState(
          allOptions: optionJson
              .map((json) => Option.fromJson(jsonEncode(json)))
              .toList()));
    } else {
      throw Exception('Failed to load equipment_categoriess');
    }
  }
}
