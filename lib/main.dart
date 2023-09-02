import 'dart:typed_data';
import 'package:gestion_hopital/bloc/ReservationBloc/reservation_bloc.dart';
import 'package:gestion_hopital/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'bloc/EquipementCategoriesBloc/equipement_categories_bloc.dart';
import 'bloc/EquipementItemBloc/equipement_item_bloc.dart';
import 'bloc/UserBloc/user_bloc.dart';
import 'gestion_hospital.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppLang(appLang: 'fr')),
      ChangeNotifierProvider(create: (_) => UserManagement()),
      ChangeNotifierProvider(
          create: (_) => EquipmentCategoriesState(equipment_categories: null)),
      ChangeNotifierProvider(
          create: (_) => AppStatus(
              isConnected: true,
              role: null,
              isActExist: false,
              isLoggedIn: false,
              textsize: 10)),
    ], child: MyApp())),
  );
}

//     .changeUserStatus(val.isSignedIn);
// var loginState = Provider.of<AppStatus>(context).userLoggedIn;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => EquipmentCategoriesBloc(),
        ),
        BlocProvider(
          create: (context) => EquipmentItemBloc(),
        ),
        BlocProvider(
          create: (context) => ReservationBloc(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: GestionHopital(),
      ),
    );
  }
}
