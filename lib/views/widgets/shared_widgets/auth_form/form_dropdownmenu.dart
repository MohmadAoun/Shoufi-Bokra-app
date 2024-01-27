import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../utils/themes/app_themes.dart';

class FormDropDownMenu extends StatelessWidget {
  final String selectedRole;
  final String hintText;
  final List<String> values;
  final Function(String?)? onChanged;
  const FormDropDownMenu(
      {super.key,
      required this.selectedRole,
      required this.hintText,
      required this.values,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: selectedRole,
      onChanged: onChanged,
      alignment: Alignment.center,
      dropdownColor: Get.isDarkMode
          ? darkTheme.inputDecorationTheme.fillColor
          : lightTheme.inputDecorationTheme.fillColor,
      style: Get.isDarkMode
          ? darkTheme.textTheme.displaySmall
          : lightTheme.textTheme.displaySmall,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.only(left: 20),
        alignLabelWithHint: true,
        filled: true,
        hintStyle: Get.isDarkMode
            ? darkTheme.textTheme.displaySmall
            : lightTheme.textTheme.displaySmall,
        border: Get.isDarkMode
            ? darkTheme.inputDecorationTheme.border
            : lightTheme.inputDecorationTheme.border,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.79,
          maxHeight: MediaQuery.of(context).size.height * 0.06,
        ),
        errorBorder: Get.isDarkMode
            ? darkTheme.inputDecorationTheme.errorBorder
            : lightTheme.inputDecorationTheme.errorBorder,
        errorStyle: Get.isDarkMode
            ? darkTheme.inputDecorationTheme.errorStyle
            : lightTheme.inputDecorationTheme.errorStyle,
        fillColor: Get.isDarkMode
            ? darkTheme.inputDecorationTheme.fillColor
            : lightTheme.inputDecorationTheme.fillColor,
        focusedBorder: Get.isDarkMode
            ? darkTheme.inputDecorationTheme.focusedBorder
            : lightTheme.inputDecorationTheme.focusedBorder,
        focusedErrorBorder: Get.isDarkMode
            ? darkTheme.inputDecorationTheme.focusedErrorBorder
            : lightTheme.inputDecorationTheme.focusedErrorBorder,
      ),
      items: values.map((value) {
        return DropdownMenuItem<String>(
          alignment: Alignment.center,
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
