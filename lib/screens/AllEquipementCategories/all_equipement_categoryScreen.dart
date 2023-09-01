import 'package:evaltech_mobile/screens/AllEquipementCategories/components/add_form_equipement_category.dart';
import 'package:evaltech_mobile/utils/navigate_screen.dart';
import 'package:flutter/material.dart';

import '../../Theme/theme_export.dart';
import '../../db/db.dart';
import '../../models/EquipementCategories.dart';
import '../../services/localisationService/t_key.dart';
import '../../widget/widget_button.dart';
import 'components/all_equipement_categoriesList.dart';
import 'package:flutter/material.dart';

class AllEquipementCategoryScreen extends StatefulWidget {
  const AllEquipementCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AllEquipementCategoryScreen> createState() =>
      _AllEquipementCategoryScreenState();
}

class _AllEquipementCategoryScreenState
    extends State<AllEquipementCategoryScreen> with TickerProviderStateMixin {
  late List<EquipmentCategories> equipementCategoriesList;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    equipementCategoriesList =
        DB().EquipmentCategoriesList; // Initialize your list
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            WidgetButton.largeButton(TKeys.add_category.translate(context),
                AppTextTheme.buttonwhite, AppColors.primaryblue, null, () {
              NavigationScreen.navigate(context, AddFormEquipementCategory());
            }),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: _gridView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gridView() {
    return GridView.builder(
      itemCount: equipementCategoriesList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 8.0 / 9.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _animation.value,
              child: AllEquipmentCategoriesList(
                equipment_categories: equipementCategoriesList[index],
              ),
            );
          },
        );
      },
    );
  }
}
