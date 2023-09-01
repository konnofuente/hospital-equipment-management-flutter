import 'dart:async';
import 'dart:convert';

import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:evaltech_mobile/bloc/ClassroomBloc/classroom_event.dart';
import 'package:evaltech_mobile/bloc/OptionBloc/option_event.dart';
import 'package:evaltech_mobile/provider/provider.dart';
import 'package:evaltech_mobile/screens/AuthScreens/sign_up/signup_screen.dart';
import 'package:evaltech_mobile/screens/DocumentViewer/latexScreen.dart';
import 'package:evaltech_mobile/screens/Launching/ChoseLangaugeScreen.dart';
import 'package:evaltech_mobile/screens/Launching/IntroScreen.dart';
import 'package:evaltech_mobile/services/callApi.dart';
import 'package:evaltech_mobile/services/internet_connection.dart';
import 'package:evaltech_mobile/services/localisationService/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'Theme/app_theme.dart';
import 'bloc/MCQBloc/mcq_bloc.dart';
import 'bloc/MCQBloc/mcq_event.dart';
import 'bloc/bloc_export.dart';
import 'models/MCQ.dart';

void main() {
  runApp(const evaltech());
}

class evaltech extends StatefulWidget {
  const evaltech({Key? key}) : super(key: key);

  @override
  State<evaltech> createState() => _evaltechState();
}

class _evaltechState extends State<evaltech> {
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
    await _FetchevaltechData();
    checkUserLoggedIn();
    //  context.read<ClassroomBloc>().add(FetchClassrooms());
  }

  Future<void> _FetchevaltechData() async {
    context.read<ClassroomBloc>().add(FetchClassrooms());
    context.read<OptionBloc>().add(FetchOptions());
    context.read<MCQBloc>().add(FetchMCQs());
    InternetConnection().CheckInternetConnectivity(context);
  }

  Future<void> checkUserLoggedIn() async {
    final email = (await _storage.read(key: "evaltech_KEY_EMAIL"));
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
              title: 'evaltech',
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
