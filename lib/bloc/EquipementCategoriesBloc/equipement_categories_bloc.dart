import 'dart:async';
import 'dart:convert';

import 'package:evaltech_mobile/bloc/EquipementCategoriesBloc/equipement_categories_event.dart';
import 'package:evaltech_mobile/bloc/EquipementCategoriesBloc/equipement_categories_state.dart';
import 'package:evaltech_mobile/models/EquipementCategories.dart';
import 'package:evaltech_mobile/models/EquipementCategories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/EquipementCategories.dart';
import '../../services/callApi.dart';
import 'package:http/http.dart' as http;

class EquipmentCategoriesBloc
    extends Bloc<EquipmentCategoriesEvent, EquipmentCategoriesState> {
  EquipmentCategoriesBloc() : super(const EquipmentCategoriesState()) {
    on<AddEquipmentCategories>(_onAddEquipmentCategories);
    on<UpdateEquipmentCategories>(_onUpdateEquipmentCategories);
    on<DeleteEquipmentCategories>(_onDeleteEquipmentCategories);
    // on<FetchEquipmentCategories>(_onFetchEquipmentCategories);
  }

  Future<FutureOr<void>> _onAddEquipmentCategories(
      AddEquipmentCategories event,
      Emitter<EquipmentCategoriesState> emit) async {
    final state = this.state;
    emit(EquipmentCategoriesState(
        allEquipmentCategories: event.EquipmentCategory));

    // final item = EquipmentCategories(
    //     // id: event.EquipmentCategorys.id,
    //     // firstName: event.EquipmentCategorys.firstName,
    //     id:event.EquipmentCategorys.id,
    //     name: event.EquipmentCategorys.name,
    //     );

    try {
      print(
          'Succesfully save of EquipmentCategories!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('OMline EquipmentCategories not created: $e !!!!!!!!!!!');
    }
  }

  Future<void> _onUpdateEquipmentCategories(UpdateEquipmentCategories event,
      Emitter<EquipmentCategoriesState> emit) async {
    final state = this.state;
    final equipment_categories = event.EquipmentCategory;
    final index = state.allEquipmentCategories.indexOf(equipment_categories);
    //update Locale storage
    List<EquipmentCategories> allEquipmentCategories =
        List.from(state.allEquipmentCategories)..remove(EquipmentCategories);
    allEquipmentCategories.insert(index, equipment_categories.copyWith());
  }

  FutureOr<void> _onDeleteEquipmentCategories(DeleteEquipmentCategories event,
      Emitter<EquipmentCategoriesState> emit) {}

  Future<void> _onFetchEquipmentCategories(FetchEquipmentCategoriess event,
      Emitter<EquipmentCategoriesState> emit) async {
    final state = this.state;
    final response =
        // await http.get(Uri.parse('http://31.187.76.34:8090/equipment_categoriess'));
        await CallApi().getData('equipment_categoriess');

    if (response.statusCode == 200) {
      final List<dynamic> equipment_categoriessJson =
          json.decode(response.body);
      emit(EquipmentCategoriesState(
          allEquipmentCategories: equipment_categoriessJson
              .map((json) => EquipmentCategories.fromJson(jsonEncode(json)))
              .toList()));
      print("successfull fetch of all EquipmentCategories!!!!!!");
    } else {
      throw Exception('Failed to load equipment_categoriess');
    }
  }
}
