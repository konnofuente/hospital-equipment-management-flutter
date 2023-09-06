import 'package:gestion_hopital/models/GridInfo.dart';

class FakeData {
  final List<GridInfo> _userList = <GridInfo>[
    GridInfo(name: "l’Administrateur", image: 'assets/Images/admin.png'),
    GridInfo(
        name: "Laboratine", image: 'assets/Images/doctor.png'),
  ];
  List<GridInfo> get userList => _userList;
}
