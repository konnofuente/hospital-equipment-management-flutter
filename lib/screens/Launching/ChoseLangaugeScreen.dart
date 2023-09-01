import 'package:evaltech_mobile/screens/TestQuestions/Tmain.dart';
import 'package:evaltech_mobile/services/localisationService/t_key.dart';
import 'package:evaltech_mobile/utils/navigate_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../Theme/text_theme.dart';
import '../../bloc/MCQBloc/mcq_state.dart';
import '../../bloc/bloc_export.dart';
import '../../services/localisationService/localization_service.dart';
import '../../provider/provider.dart';
import 'OnBoardingScreen.dart';

class ChoseLangaugeScreen extends StatefulWidget {
  const ChoseLangaugeScreen({Key? key}) : super(key: key);

  @override
  State<ChoseLangaugeScreen> createState() => _ChoseLangaugeScreenState();
}

class _ChoseLangaugeScreenState extends State<ChoseLangaugeScreen> {
  final localizationController = Get.find<LocalizationController>();
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    String LangCode = Provider.of<AppLang>(context).appLang;
    return BlocBuilder<MCQBloc, MCQState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              child: _inProgress
                  // ignore: prefer_const_constructors
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ignore: prefer_const_constructors
                            InkWell(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  // ignore: prefer_const_constructors
                                  padding: EdgeInsets.only(
                                    left: 67,
                                    top: 275,
                                    right: 67,
                                  ),
                                  child: Text(
                                    TKeys.chose_lang.translate(context),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppTextTheme.title,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                // await localizationController
                                //     .toggleLanguage('en');
                                // print(_inProgress);
                                // NavigationScreen.navigate(
                                //     context, OnBoardingScreen());
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 77,
                                      top: 53,
                                      right: 77,
                                    ),
                                    child: TextButton.icon(
                                      label: Text(
                                        TKeys.en.translate(context),
                                        style: AppTextTheme.listtitle,
                                      ),
                                      onPressed: () async {
                                        // NavigationScreen.navigate(
                                        //     context, Tmain());

                                        await localizationController
                                            .toggleLanguage('en');
                                        print(_inProgress);
                                        NavigationScreen.navigate(
                                            context, OnBoardingScreen());
                                      },
                                      icon: Image.asset(
                                          'assets/Images/enflag.png'),
                                    )),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 77,
                                        top: 20,
                                        right: 77,
                                        bottom: 400,
                                      ),
                                      child: TextButton.icon(
                                        onPressed: () async {
                                          await localizationController
                                              .toggleLanguage('fr');

                                          print(_inProgress);
                                          // Navigator.of(context).pop();

                                          NavigationScreen.navigate(
                                              context, OnBoardingScreen());
                                        },
                                        icon: Image.asset(
                                            'assets/Images/frflag.png'),
                                        label: Text(
                                          TKeys.fr.translate(context),
                                          style: AppTextTheme.listtitle,
                                        ),
                                      )),
                                ),
                              ),
                              onTap: () async {
                                await localizationController
                                    .toggleLanguage('fr');

                                print(_inProgress);
                                // Navigator.of(context).pop();

                                NavigationScreen.navigate(
                                    context, OnBoardingScreen());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
