import 'package:flutter/material.dart';
import '../Theme/app_theme.dart';

class WidgetTextForm {
  static TextFormField getTextField(
      String text,
      TextEditingController controller,
      TextInputType keytype,
      String errorText,
      Widget icon) {
    return TextFormField(
        controller: controller,
        keyboardType: keytype,
        obscureText: keytype == TextInputType.visiblePassword ? true : false,
        // obscureText: true,
        decoration: InputDecoration(
          fillColor: AppColors.primaryblue,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
          prefixIcon: icon,
          labelText: text,
          // hintText: hinttext.isEmpty ? hinttext : ' ',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(color: Colors.blue)),
        ),
        validator: (val) => val!.isEmpty ? errorText : null,
        onChanged: (val) {
          // setState(() => uname = val);
        });
  }

  static TextField updateTextField(
      String text,
      TextEditingController controller,
      TextInputType? keytype,
      String? errorText,
      Widget? icon) {
    return TextField(
      keyboardType: keytype,
      obscureText: keytype == TextInputType.visiblePassword ? true : false,
      decoration: InputDecoration(
        labelText: text,
      ),
      onChanged: (value) {},
      controller: controller,
    );
  }

  static TextFormField getDatePicker(
      BuildContext context,
      String text,
      TextEditingController controller,
      Widget? icon) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));
        if (pickedDate != null && pickedDate != DateTime.now())
          controller.text =
              "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      },
      decoration: InputDecoration(
        labelText: text,
        hintText: "Pick a Date",
      ),
    );
  }
}
