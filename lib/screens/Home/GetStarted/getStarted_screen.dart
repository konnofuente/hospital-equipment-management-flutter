import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_hopital/screens/Home/GetStarted/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/UserBloc/user_bloc.dart';
import '../../../provider/provider.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userBloc = BlocProvider.of<UserBloc>(context);
      Provider.of<UserManagement>(context, listen: false).changeUser(userBloc.state.appUser!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetStartedBody(),
    );
  }
}
