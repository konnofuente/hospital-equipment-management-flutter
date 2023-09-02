import 'dart:async';
import 'package:gestion_hopital/bloc/bloc_export.dart';
import 'package:gestion_hopital/screens/Home/GetStarted/components/body.dart';
import 'package:flutter/material.dart';

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
