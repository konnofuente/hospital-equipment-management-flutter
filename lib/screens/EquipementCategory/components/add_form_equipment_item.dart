import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Theme/theme_export.dart';
import '../../../bloc/EquipementItemBloc/equipement_Item_event.dart';
import '../../../bloc/EquipementItemBloc/equipement_item_bloc.dart';
import '../../../models/EquipementItem.dart';
import '../../../widget/widget_button.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_textformfield.dart';

class AddFormEquipementItem extends StatefulWidget {
  @override
  _AddFormEquipementItemState createState() => _AddFormEquipementItemState();
}

class _AddFormEquipementItemState extends State<AddFormEquipementItem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  void emptyField() {
    nameController.clear();
    descriptionController.clear();
    quantityController.clear();
  }

  void saveEquipmentItem(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Create a new EquipmentItem based on the user input
      EquipmentItem newEquipmentItem = EquipmentItem(
        id: 1, // Generate ID here
        name: nameController.text,
        description: descriptionController.text,
        quantity: int.parse(quantityController.text),
      );

      // Fetch the EquipmentItemBloc
      EquipmentItemBloc equipmentItemBloc =
          BlocProvider.of<EquipmentItemBloc>(context);

      // Add the new EquipmentItem to the EquipmentItemBloc
      equipmentItemBloc.add(AddEquipmentItem(Item: newEquipmentItem));

      // Clear the fields
      emptyField();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Equipment Item"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              WidgetTextForm.getTextField(
                "Name",
                nameController,
                TextInputType.text,
                "Enter name",
                WidgetIcon.userAccount(false),
              ),
              SizedBox(
                height: 15,
              ),
              WidgetTextForm.getTextField(
                "Description",
                descriptionController,
                TextInputType.text,
                "Enter description",
                WidgetIcon.userAccount(false),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  hintText: 'Enter quantity',
                  prefixIcon: Icon(Icons.add_box),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              WidgetButton.largeButton(
                "Submit",
                AppTextTheme.buttonwhite,
                AppColors.primaryblue,
                null,
                () => saveEquipmentItem(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
