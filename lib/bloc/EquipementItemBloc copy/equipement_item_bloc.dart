import 'dart:async';
import 'dart:convert';
import 'package:evaltech_mobile/bloc/EquipementItemBloc%20copy/equipement_item_event.dart';
import 'package:evaltech_mobile/bloc/EquipementItemBloc%20copy/equipement_item_state.dart';
import 'package:evaltech_mobile/models/EquipementItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/EquipementItem.dart';
import '../../services/callApi.dart';
import 'package:http/http.dart' as http;

class EquipmentItemBloc
    extends Bloc<EquipmentItemEvent, EquipmentItemState> {
  EquipmentItemBloc() : super(const EquipmentItemState()) {
    on<AddEquipmentItem>(_onAddEquipmentItem);
    on<UpdateEquipmentItem>(_onUpdateEquipmentItem);
    on<DeleteEquipmentItem>(_onDeleteEquipmentItem);
    // on<FetchEquipmentItem>(_onFetchEquipmentItem);
  }

  Future<FutureOr<void>> _onAddEquipmentItem(
      AddEquipmentItem event,
      Emitter<EquipmentItemState> emit) async {
    final state = this.state;
    emit(EquipmentItemState(
        allEquipmentItem: event.Item));

    // final item = EquipmentItem(
    //     // id: event.Items.id,
    //     // firstName: event.Items.firstName,
    //     id:event.Items.id,
    //     name: event.Items.name,
    //     );

    try {
      print(
          'Succesfully save of EquipmentItem!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('OMline EquipmentItem not created: $e !!!!!!!!!!!');
    }
  }

  Future<void> _onUpdateEquipmentItem(UpdateEquipmentItem event,
      Emitter<EquipmentItemState> emit) async {
    final state = this.state;
    final equipment_Item = event.Item;
    final index = state.allEquipmentItem.indexOf(equipment_Item);
    //update Locale storage
    List<EquipmentItem> allEquipmentItem =
        List.from(state.allEquipmentItem)..remove(EquipmentItem);
    allEquipmentItem.insert(index, equipment_Item.copyWith());
  }

  FutureOr<void> _onDeleteEquipmentItem(DeleteEquipmentItem event,
      Emitter<EquipmentItemState> emit) {}

  Future<void> _onFetchEquipmentItem(FetchEquipmentItems event,
      Emitter<EquipmentItemState> emit) async {
    final state = this.state;
    final response =
        // await http.get(Uri.parse('http://31.187.76.34:8090/equipment_Items'));
        await CallApi().getData('equipment_Items');

    if (response.statusCode == 200) {
      final List<dynamic> equipment_ItemsJson =
          json.decode(response.body);
      emit(EquipmentItemState(
          allEquipmentItem: equipment_ItemsJson
              .map((json) => EquipmentItem.fromJson(jsonEncode(json)))
              .toList()));
      print("successfull fetch of all EquipmentItem!!!!!!");
    } else {
      throw Exception('Failed to load equipment_Items');
    }
  }
}
