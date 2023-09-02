import 'dart:async';
import 'package:gestion_hopital/bloc/bloc_export.dart';
import 'package:gestion_hopital/screens/Home/DashBaord/DashBoard.dart';
import 'package:gestion_hopital/screens/Home/GetStarted/components/body.dart';
import 'package:gestion_hopital/screens/Home/home.dart';
import 'package:gestion_hopital/services/localisationService/t_key.dart';
import 'package:flutter/material.dart';

import '../../../Theme/app_theme.dart';
import '../../../Theme/text_theme.dart';
import '../../../utils/navigate_screen.dart';
import '../../../widget/widget_button.dart';
import '../../QuizScreen/quiz/components/body.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  void initState() {
    _FetchPersonalData();
    super.initState();
  }

  Future<void> _FetchPersonalData() async {
    context.read<UserBloc>().add(FetchUsersInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetStartedBody(),
    );
  }
}
