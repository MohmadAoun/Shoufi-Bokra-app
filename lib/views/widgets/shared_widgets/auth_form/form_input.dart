import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoufibokra/consts/app_style.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';

class FormInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool visible;
  final String? Function(String?)? validator;

  const FormInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.visible = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: TextFormField(
          onChanged: onChanged,
          keyboardType: textInputType,
          style: Get.isDarkMode
              ? darkTheme.textTheme.bodyMedium
              : lightTheme.textTheme.bodyMedium,
          validator: validator,
          obscureText: obscureText,
          controller: controller,
          cursorColor: Get.isDarkMode
              ? AppColors.SECONDARY_DARK_COLOR
              : AppColors.SECONDARY_LIGHT_COLOR,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: hintText,
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
          )),
    );
  }
}
