import 'package:evaltech_mobile/models/EquipementCategories.dart';
import 'package:evaltech_mobile/models/EquipementItem.dart';
import 'package:evaltech_mobile/screens/AuthScreens/verifie_email.dart';
import 'package:evaltech_mobile/screens/Home/GetStarted/getStarted_screen.dart';
import 'package:evaltech_mobile/utils/is_loading_indicator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Theme/app_theme.dart';
import '../../../Theme/text_theme.dart';
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

class AddFormEquipementCategory extends StatefulWidget {
  const AddFormEquipementCategory({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddFormEquipementCategoryState createState() => _AddFormEquipementCategoryState();
}

class _AddFormEquipementCategoryState extends State<AddFormEquipementCategory> {
  final _formKey = GlobalKey<FormState>();
  late bool alert;
  TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
  final TextEditingController releaseDateController = TextEditingController();
  final TextEditingController directorsController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  // Placeholder for image upload
  String? imageUrl;
  String? bannerUrl;
  String? trailerImg1;
  String? secondImg;
  TextInputType emailKeytype = TextInputType.emailAddress;
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;



  @override
  void initState() {
    checkconnection();
    super.initState();
  }

  void checkconnection() async {
    await InternetConnection().CheckInternetConnectivity(context);
  }


  @override
  Widget build(BuildContext context) {
    Role? role = Provider.of<AppStatus>(context).role;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Equipment Category"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              WidgetTextForm.getTextField(
                  "Name", nameController, TextInputType.text, "Enter name", WidgetIcon.userAccount(false)),
                  SizedBox(height: 15,),
              WidgetTextForm.getTextField("Directors", directorsController,
                  TextInputType.text, "Enter directors", WidgetIcon.userAccount(false)),
                  SizedBox(height: 15,),
              WidgetTextForm.getTextField("Description", descController,
                  TextInputType.text, "Enter description", WidgetIcon.userAccount(false)),
                  SizedBox(height: 15,),
              // Date Picker
              TextFormField(
                controller: releaseDateController,
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null && pickedDate != DateTime.now())
                    releaseDateController.text =
                        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                },
                decoration: InputDecoration(
                  labelText: "Release Date",
                  hintText: "Pick a Date",
                ),
              ),
              // Image upload placeholders
                  SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  // Implement your image upload logic here
                },
                child: Text("Upload Image"),
              ),
                  SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  // Implement your banner upload logic here
                },
                child: Text("Upload Banner"),
              ),
                  SizedBox(height: 15,),
              // ... (add more upload buttons for other images)
              ElevatedButton(
                onPressed: () {
                  // Create EquipmentCategories object
                  // EquipmentCategories newEquipmentCategory = EquipmentCategories(
                  //   id: 1, // Generate ID here
                  //   name: nameController.text,
                  //   items: EquipmentItem[],
                  //   releaseDateDesc: releaseDateController.text,
                  //   directors: directorsController.text,
                  //   desc: descController.text,
                  //   imageUrl: imageUrl,
                  //   bannerUrl: bannerUrl,
                  //   trailerImg1: trailerImg1,
                  //   secondImg: secondImg,
                  // );
                  // // Implement logic to add newEquipmentCategory to your data source
                  // // For now, let's print it.
                  // print(newEquipmentCategory);
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
