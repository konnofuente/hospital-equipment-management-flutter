import 'package:evaltech_mobile/models/GridInfo.dart';

class FakeData {
  final List<GridInfo> _categoriesList = <GridInfo>[
    GridInfo(name: "teacher", image: 'assets/Images/teacher.png'),
    GridInfo(name: "student", image: 'assets/Images/student.png'),
  ];
  List<GridInfo> get categoriesList => _categoriesList;
}
