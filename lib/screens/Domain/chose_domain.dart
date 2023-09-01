import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Theme/app_theme.dart';
import '../../Theme/text_theme.dart';
import '../../utils/navigate_screen.dart';
import '../../widget/widget_button.dart';
import '../Home/GetStarted/getStarted_screen.dart';

class ChosedDomain extends StatefulWidget {
  @override
  ChosedDomainState createState() => ChosedDomainState();
}

class ChosedDomainState extends State<ChosedDomain> {
  bool selectCondition = false;
  bool valueCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Chose Domain',
                    style: AppTextTheme.bigtitle,
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                    "evaltech need to know the proffesional Carriere your engage in that is your domain in order to access you the specifique requirement you need ",
                    style: AppTextTheme.caption,
                  )),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              // ignore: prefer_const_constructors
              Text(
                'Chose one or more ',
                textDirection: TextDirection.ltr,
                style: AppTextTheme.title,
              ),

              SizedBox(
                height: 30,
              ),
              WidgetButton.largeButton('Confirm', AppTextTheme.buttonwhite,
                  AppColors.primaryblue, null, () {
                NavigationScreen.navigate(context, GetStartedScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
