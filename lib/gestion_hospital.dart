import 'dart:async';
import 'dart:convert';
import 'package:gestion_hopital/provider/provider.dart';
import 'package:gestion_hopital/screens/Launching/ChoseLangaugeScreen.dart';
import 'package:gestion_hopital/services/internet_connection.dart';
import 'package:gestion_hopital/services/localisationService/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'Theme/app_theme.dart';
import 'Theme/theme_export.dart';
import 'bloc/EquipementCategoriesBloc/equipement_categories_bloc.dart';
import 'bloc/EquipementCategoriesBloc/equipement_categories_event.dart';
import 'bloc/MCQBloc/mcq_bloc.dart';
import 'bloc/MCQBloc/mcq_event.dart';
import 'bloc/OptionBloc/option_event.dart';
import 'bloc/bloc_export.dart';
import 'models/MCQ.dart';

void main() {
  runApp(const GestionHopital());
}

class GestionHopital extends StatefulWidget {
  const GestionHopital({Key? key}) : super(key: key);

  @override
  State<GestionHopital> createState() => _GestionHopitalState();
}

class _GestionHopitalState extends State<GestionHopital> {
  // This widget is the root of your application.
  late List<MCQ> allMCQs;
  final _storage = const FlutterSecureStorage();
  @override
  void initState() {
    _loadingProcess();
    super.initState();
  }

  final localizationController = Get.put(LocalizationController());

  Future<void> _loadingProcess() async {
    await _FetchGestionHopitalData();
    checkUserLoggedIn();
    //  context.read<EquipmentCategoriesBloc>().add(FetchEquipmentCategoriess());
  }

  Future<void> _FetchGestionHopitalData() async {
    context.read<EquipmentCategoriesBloc>().add(FetchEquipmentCategoriess());
    context.read<OptionBloc>().add(FetchOptions());
    context.read<MCQBloc>().add(FetchMCQs());
    InternetConnection().CheckInternetConnectivity(context);
  }

  Future<void> checkUserLoggedIn() async {
    final email = (await _storage.read(key: "GestionHopital_KEY_EMAIL"));
    // Check if email exists in storage to determine login state
    // print(email.runtimeType);
    print(email);
    email == null
        ? Provider.of<AppStatus>(context, listen: false)
            .changeLoginStatus(false)
        : Provider.of<AppStatus>(context, listen: false)
            .changeLoginStatus(true);

    print(
        "user status login is ${Provider.of<AppStatus>(context, listen: false).isLoggedIn}");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        init: localizationController,
        builder: (LocalizationController controller) {
          return MaterialApp(
              title: 'GestionHopital',
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: ThemeData(primarySwatch: Colors.blue),
              locale: controller.currentLanguage != ''
                  ? Locale(controller.currentLanguage, '')
                  : null,
              localeResolutionCallback:
                  LocalizationService.localeResolutionCallBack,
              supportedLocales: LocalizationService.supportedLocales,
              localizationsDelegates: LocalizationService.localizationsDelegate,
              home: Provider.of<AppStatus>(context).isConnected
                  ? ChoseLangaugeScreen()
                  : Container(
                      color: Colors.white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            Text(
                              "check your internet connection",
                              style: AppTextTheme.title,
                            )
                          ]))
              // home: SignUp(),
              );
        });
  }
}
