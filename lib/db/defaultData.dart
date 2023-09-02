import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_hopital/models/User.dart';

import '../bloc/bloc_export.dart';
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

  
}
