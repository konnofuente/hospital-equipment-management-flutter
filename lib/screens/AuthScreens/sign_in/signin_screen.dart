import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_hopital/utils/is_loading_indicator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Theme/app_theme.dart';
import '../../../Theme/text_theme.dart';
import '../../../bloc/bloc_export.dart';
import '../../../models/Role.dart';
import '../../../services/auth.dart';
import '../../../services/internet_connection.dart';
import '../../../services/localisationService/t_key.dart';
import '../../../provider/provider.dart';
import '../../../utils/navigate_screen.dart';
import '../../../widget/widget_alertbox.dart';
import '../../../widget/widget_button.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_textformfield.dart';
import '../sign_up/components/verifie_email.dart';
import '../sign_up/signup_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late bool alert;
  late String email, pwd, token;
  TextEditingController emailController = TextEditingController();
  TextInputType emailKeytype = TextInputType.emailAddress;
  TextEditingController passwordController = TextEditingController();
  Icon icon = Icon(Icons.visibility);
  Icon hide_icon = Icon(Icons.visibility_off);
  bool isPasswordVisible = false;
  bool _isLoading = false; //bool variable created
  final _storage = const FlutterSecureStorage();

  Future<void> _readCredentialFromStorage() async {
    emailController.text =
        (await _storage.read(key: "gestion_hopital_KEY_EMAIL"))!;
    passwordController.text =
        (await _storage.read(key: "gestion_hopitalhopital_KEY_PASSWORD"))!;
  }

  @override
  void initState() {
    _readCredentialFromStorage();
    checkconnection();
    super.initState();
  }

  void checkconnection() async {
    await InternetConnection().CheckInternetConnectivity(context);
  }

  Future<void> loginVerification() async {
    if (_formKey.currentState!.validate()) {
      AuthService authService = AuthService();

      await authService.localloginUser(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Role? role = Provider.of<AppStatus>(context).role;

    return Scaffold(
      body: !Provider.of<AppStatus>(context).isConnected
          ? isLoadingIndicator.CircularLoading("Check your internet Connection")
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          TKeys.sign_in.translate(context),
                          textAlign: TextAlign.center,
                          style: AppTextTheme.bigtitle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                              // height: 20,
                              child: Text(
                            TKeys.welcome.translate(context),
                            style: AppTextTheme.header,
                          )),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 20,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  WidgetIcon.alert(true),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      " ${TKeys.auth_user_info.translate(context)} : ${role == Role.ADMIN ? Role.ADMIN.name : Role.RESPONSABLE.name}",
                                      style: AppTextTheme.caption,
                                    ),
                                  ),
                                ],
                              )),
                        ]),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          WidgetTextForm.getTextField(
                              TKeys.email.translate(context),
                              emailController,
                              emailKeytype,
                              TKeys.email.translate(context),
                              WidgetIcon.userAccount(false)),
                          const SizedBox(height: 20),
                          const SizedBox(height: 20),
                          TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.vpn_key,
                                    color: Colors.blue),
                                labelText: TKeys.pwd.translate(context),
                                hintText: "",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                      print(!isPasswordVisible);
                                    });
                                  },
                                  icon: isPasswordVisible ? icon : hide_icon,
                                ),
                                // ignore: prefer_const_constructors
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.blue)),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: isPasswordVisible,
                              validator: (val) => val!.isEmpty
                                  ? TKeys.pwd.translate(context)
                                  : null,
                              onChanged: (val) {
                                setState(() => pwd = val);
                              }),
                          const SizedBox(height: 40),
                          WidgetButton.largeButton(
                              TKeys.sign_in.translate(context),
                              AppTextTheme.buttonwhite,
                              AppColors.primaryblue,
                              null, () async {
                            loginVerification();
                          }),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        WidgetButton.textButton(TKeys.f_pwd.translate(context),
                            AppTextTheme.caption, () {
                          NavigationScreen.replaceNavigate(
                              context, const ConfirmEmail());
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WidgetButton.textButton(
                                TKeys.did_not_have_acct.translate(context),
                                AppTextTheme.body2,
                                () {}),
                            role == Role.ADMIN
                                ? WidgetButton.textButton(
                                    TKeys.sign_up.translate(context),
                                    AppTextTheme.link, () {
                                    NavigationScreen.navigate(
                                        context, const SignUp());
                                  })
                                : WidgetButton.textButton(
                                    TKeys.request_acct.translate(context),
                                    AppTextTheme.link, () {
                                    AlertBox.awesomeOkBox(
                                        context,
                                        "Requette de Compte ",
                                        "Contacter l'administrateur pour la creation de votre compte",
                                        () {});
                                  }),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
