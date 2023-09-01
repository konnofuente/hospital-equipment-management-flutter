import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:evaltech_mobile/screens/Classroom/ClassroomScreen.dart';
import 'package:evaltech_mobile/screens/Home/GetRatings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/EquipementCategories.dart';
import '../../provider/provider.dart';
import '../../models/Item.dart';

class EquipmentCategoriesList extends StatefulWidget {
  final EquipmentCategories equipment_categories;

  const EquipmentCategoriesList({required this.equipment_categories});

  @override
  State<EquipmentCategoriesList> createState() =>
      _EquipmentCategoriesListState();
}

class _EquipmentCategoriesListState extends State<EquipmentCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<EquipmentCategoriesState>(context, listen: false)
            .setGlobalEquipmentCategories(widget.equipment_categories);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EquipmentCategoriesScreen(),
          ),
        );
      },
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 12.0,
              child: Image.asset(
                widget.equipment_categories.trailerImg1!,
                fit: BoxFit.fill,
              ),
            ),
            // ignore: unnecessary_new
            new Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(widget.equipment_categories.name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextTheme.gridlisttitle),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(widget.equipment_categories.directors!,
                      style: AppTextTheme.caption),
                  SizedBox(height: 2.0),
                  Center(child: GetRatings()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderContent extends StatelessWidget {
  final Item equipment_categories;

  HeaderContent(this.equipment_categories);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(equipment_categories.name,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.gridlisttitle),
                  Text(
                    equipment_categories.category,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 9.0,
                    ),
                  ),
                  GetRatings(),
                  MovieDesc(this.equipment_categories),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDesc extends StatelessWidget {
  final Item equipment_categories;

  MovieDesc(this.equipment_categories);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'RELEASE DATE:',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  equipment_categories.releaseDate,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'RUNTIME:',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  equipment_categories.runtime,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
