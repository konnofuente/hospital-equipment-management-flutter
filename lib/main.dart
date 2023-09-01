import 'package:evaltech_mobile/bloc/ClassroomBloc/classroom_bloc.dart';
import 'package:evaltech_mobile/evaltech.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/Components/GroupList/group_list.dart';
import 'package:evaltech_mobile/screens/Classroom/ClassroomScreen.dart';
import 'package:evaltech_mobile/screens/QuizScreen/MainQuizScreen.dart';
import 'package:evaltech_mobile/provider/provider.dart';
import 'package:evaltech_mobile/test.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'bloc/MCQBloc/mcq_bloc.dart';
import 'bloc/OptionBloc/option_bloc.dart';
import 'bloc/UserBloc/user_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppLang(appLang: 'fr')),
      ChangeNotifierProvider(create: (_) => UserCreation()),
      ChangeNotifierProvider(create: (_) => ClassroomState(classroom: null)),
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
          create: (context) => MCQBloc(),
        ),
        BlocProvider(
          create: (context) => ClassroomBloc(),
        ),
        BlocProvider(
          create: (context) => OptionBloc(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: evaltech(),
      ),
    );
  }
}
