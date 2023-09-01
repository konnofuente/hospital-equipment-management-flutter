import 'package:evaltech_mobile/models/GridInfo.dart';

class FakeData {
  final List<GridInfo> _equipment_categoriesList = <GridInfo>[
    GridInfo(name: "teacher", image: 'assets/Images/teacher.png'),
    GridInfo(name: "student", image: 'assets/Images/student.png'),
  ];
  List<GridInfo> get equipment_categoriesList => _equipment_categoriesList;
}
