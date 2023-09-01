// ignore_for_file: prefer_const_constructors
import 'package:evaltech_mobile/screens/ChatgroupScreen/ChatgroupScreen.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/Components/chat_screen.dart';
import 'package:evaltech_mobile/screens/PastQuestions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Theme/app_theme.dart';
import '../../models/EquipementCategories.dart';
import '../../models/Item.dart';
import '../../provider/provider.dart';
import '../../services/localisationService/t_key.dart';
import '../Home/GridItemDetails.dart';
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
        return MainQuizScreen();
      } else if (selectedIndex == 1) {
        return ChatScreen();
      } else if (selectedIndex == 2) {
        return GridItemDetails(globalItem);
      } else if (selectedIndex == 3) {
        // return GridItemDetails(this.widget.item);
        return PastQuestionsScreen();
      } else if (selectedIndex == 4) {
        return const StatisticScreen();
      }
      return GridItemDetails(globalItem);
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

  List<BottomNavigationBarItem> getBottomItem(BuildContext context) {
    return [
      BottomNavigationBarItem(
          icon: Image.asset('assets/Icons/icon_quiz.png',
              height: 24.66,
              width: 24.66,
              fit: BoxFit.cover,
              color: Color.fromRGBO(78, 86, 107, 1)),
          // .paddingTop(12),
          label: TKeys.quiz.translate(context),
          activeIcon: Image.asset('assets/Icons/icon_quiz.png',
              height: 24.66,
              width: 24.66,
              fit: BoxFit.cover,
              color: AppColors.primarydark)
          // .paddingTop(12),
          ),
      BottomNavigationBarItem(
          icon: Image.asset('assets/Icons/icon_group.png',
              height: 24.66,
              width: 24.66,
              fit: BoxFit.cover,
              color: Color.fromRGBO(78, 86, 107, 1)),
          // .paddingTop(12),
          label: TKeys.group.translate(context),
          activeIcon: Image.asset(
            'assets/Icons/icon_group.png',
            height: 24.66,
            width: 24.66,
            fit: BoxFit.cover,
            // color: AppColors.primarydark
          )
          // .paddingTop(12),
          ),
      BottomNavigationBarItem(
          icon: Image.asset('assets/Icons/icon_document.png',
              height: 24.66,
              width: 24.66,
              fit: BoxFit.cover,
              color: Color.fromRGBO(78, 86, 107, 1)),
          // .paddingTop(12),
          // label: TKeys.doc.translate(context),
          label: TKeys.doc.translate(context),
          activeIcon: Image.asset(
            'assets/Icons/icon_document.png',
            height: 23.00,
            width: 23.00,
            fit: BoxFit.cover,
            // color: AppColors.primarydark
          )
          // .paddingTop(12),
          ),
      BottomNavigationBarItem(
          icon: Image.asset('assets/Icons/icon_facilities.png',
              height: 24.66,
              width: 24.66,
              fit: BoxFit.cover,
              color: Color.fromRGBO(78, 86, 107, 1)),
          // .paddingTop(12),
          // label: TKeys.facilities.translate(context),
          label: TKeys.facilities.translate(context),
          activeIcon: Image.asset(
            'assets/Icons/icon_facilities.png',
            height: 23.00,
            width: 23.00,
            fit: BoxFit.cover,
            // color: AppColors.primarydark
          )
          // .paddingTop(12),
          ),
      BottomNavigationBarItem(
          icon: Image.asset('assets/Icons/icon_statistics.png',
              height: 24.66,
              width: 24.66,
              fit: BoxFit.cover,
              color: Color.fromRGBO(78, 86, 107, 1)),
          // .paddingTop(12),
          // label: TKeys.stat.translate(context),
          label: TKeys.stat.translate(context),
          activeIcon: Image.asset(
            'assets/Icons/icon_statistics.png',
            height: 23.00,
            width: 23.00,
            fit: BoxFit.cover,
            // color: AppColors.primarydark
          )
          // .paddingTop(12),
          ),
    ];
  }
}
