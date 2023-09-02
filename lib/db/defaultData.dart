import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_hopital/models/EquipementCategories.dart';
import 'package:gestion_hopital/models/User.dart';
import 'package:gestion_hopital/models/function.dart';

import '../bloc/EquipementCategoriesBloc/equipement_categories_event.dart';
import '../bloc/EquipementItemBloc/equipement_Item_event.dart';
import '../bloc/bloc_export.dart';
import '../models/EquipementItem.dart';
import '../models/Role.dart';

class DefaultData {
  void defautlUSer(BuildContext context, Role role) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    User defaultUser = User(
      id: 1,
      firstName: 'Default',
      lastName: 'User',
      phoneNumber: '1234567890',
      email: 'admin',
      password: '123',
      role: role.name,
    );
    userBloc.add(AddUsers(users: defaultUser, context: context));
  }

  Future<void> initializeData(BuildContext context) async {
    String data = await rootBundle.loadString('assets/data/data.json');
    Map<String, dynamic> jsonData = jsonDecode(data);

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    EquipmentItemBloc equipmentItemBloc =
        BlocProvider.of<EquipmentItemBloc>(context);

    EquipmentCategoriesBloc equipmentCategoriesBloc =
        BlocProvider.of<EquipmentCategoriesBloc>(context);

    // Initialize users
    for (var userData in jsonData['users']) {
      User user = User(
        id: null, // ID will be generated
        firstName: userData['firstName'],
        lastName: userData['lastName'],
        phoneNumber: userData['phoneNumber'],
        email: userData['email'],
        password: userData['password'],
        role: userData['role'],
      );
      userBloc.add(AddUsers(context: context, users: user));
    }

    // Initialize categories
    for (var categoryData in jsonData['categories']) {
      EquipmentCategories category = EquipmentCategories(
        id: AppFunction()
            .generateUserId(categoryData['name']), // ID will be generated
        name: categoryData['name'],
        releaseDateDesc: categoryData['releaseDateDesc'],
        directors: categoryData['directors'],
        desc: categoryData['desc'],
        imageUrl:
            '/data/user/0/com.example.gestion_hopital/cache/2bc600ca-edb3-4652-b189-01d566eedd32/Génétique .jpg',
        bannerUrl:
            '/data/user/0/com.example.gestion_hopital/cache/2bc600ca-edb3-4652-b189-01d566eedd32/Génétique .jpg',
        items: [], // Initialize empty
      );
      print(category.id);
      equipmentCategoriesBloc
          .add(AddEquipmentCategories(EquipmentCategory: category));
    }

    // Initialize items
    for (var itemData in jsonData['items']) {
      EquipmentItem item = EquipmentItem(
        id: AppFunction()
            .generateUserId(itemData['name']), // ID will be generated
        EquipementCategoryID:
            AppFunction().generateUserId(itemData['EquipementCategoryID']),
        name: itemData['name'],
        description: itemData['description'],
        quantity: itemData['quantity'],
        itemDetails: [], // Initialize empty
      );
      equipmentItemBloc.add(AddEquipmentItem(Item: item));
      equipmentCategoriesBloc.add(AddItemEquipmentCategories(
            Item: item,
            EquipmentCategoryId:  AppFunction().generateUserId(itemData['EquipementCategoryID'])));
    }

    print("generation complete~~~~~~");
  }
}
