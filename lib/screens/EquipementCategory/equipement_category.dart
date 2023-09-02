// ignore_for_file: prefer_const_constructors
import 'package:evaltech_mobile/models/function.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/ChatgroupScreen.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/Components/chat_screen.dart';
import 'package:evaltech_mobile/screens/EquipementCategory/components/add_form_equipment_item.dart';
import 'package:evaltech_mobile/screens/EquipementCategory/widgets/getBottomItem.dart';
import 'package:evaltech_mobile/screens/ListEquipementItem/list_equipement_item.dart';
import 'package:evaltech_mobile/screens/PastQuestions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Theme/app_theme.dart';
import '../../models/EquipementCategories.dart';
import '../../models/Item.dart';
import '../../provider/provider.dart';
import '../../services/localisationService/t_key.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../QuizScreen/MainQuizScreen.dart';
import '../StatisticScreen/StatisticScreen.dart';

class EquipementCategoryScreen extends StatefulWidget {
  // final Item item;
  // EquipementCategoryScreen(this.item);
  EquipementCategoryScreen();

  @override
  State<EquipementCategoryScreen> createState() =>
      _EquipementCategoryScreenState();
}

class _EquipementCategoryScreenState extends State<EquipementCategoryScreen> {
  //  EquipementCategoryScreen({Key? key, required this.item}) : super(key: key);
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  int selectedIndex = 2;

  String AppBarTitle = 'evaltech';

  @override
  void initState() {
    // setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EquipmentCategories globalItem =
        Provider.of<EquipmentCategoriesState>(context).equipment_categories
            as EquipmentCategories;

    Widget getFragment() {
      if (selectedIndex == 0) {
        return ListEquipementItem(globalItem);
      } else if (selectedIndex == 1) {
        return AddFormEquipementItem(equipmentCategory:globalItem ,);
      }
      return ListEquipementItem(globalItem);
    }

    return Scaffold(
      body: getFragment(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(0),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.bottomtap,
          items: getBottomItem(context),
          onTap: (val) {
            // AppBarName();
            setState(() {
              selectedIndex = val;
            });
            print(selectedIndex);
          },
          currentIndex: selectedIndex,
        ),
      ),
    );
  }


}
