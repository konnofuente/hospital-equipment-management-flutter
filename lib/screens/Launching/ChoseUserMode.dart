import 'package:gestion_hopital/Theme/app_theme.dart';
import 'package:gestion_hopital/models/Role.dart';
import 'package:gestion_hopital/screens/AuthScreens/sign_in/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../data.dart';
import '../../models/GridInfo.dart';
import '../../services/localisationService/t_key.dart';
import '../../provider/provider.dart';
import '../../utils/navigate_screen.dart';

class ChoseUserMode extends StatelessWidget {
  const ChoseUserMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<GridInfo> _list = FakeData().userList;
    Role? role = Provider.of<AppStatus>(context).role;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/Images/logo.png',
              height: 150,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 70),
                child: AnimationLimiter(
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                        itemCount: _list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredGrid(
                              columnCount: 1,
                              position: index,
                              duration: Duration(milliseconds: 1000),
                              child: ScaleAnimation(
                                  child: FadeInAnimation(
                                      delay: Duration(milliseconds: 100),
                                      child: InkWell(
                                          onTap: () {
                                            // print(index);
                                            Provider.of<AppStatus>(context,
                                                    listen: false)
                                                .setUserRole(index);
                                            NavigationScreen.navigate(
                                                context, SignIn());
                                            // print(Role.STUDENT.name);
                                          },
                                          child: listItem(
                                              _list[index], context)))));
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(GridInfo GridInfo, BuildContext context) {
    return Card(
        shadowColor: AppColors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(0),
              child: Image.asset(GridInfo.image),
            ),
            SizedBox(
              height: 26,
            ),
            Text(
              GridInfo.name == "Admin" ? "Admin" : "Responsable de laboratoire",
              style: TextStyle(fontSize: 18),
            ),
            // SizedBox(height: 10,)
          ],
        ));
  }
}
