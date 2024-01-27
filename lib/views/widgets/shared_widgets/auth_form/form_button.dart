import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';

class FormButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonOnPressed;
  final bool fillColor;
  const FormButton(
      {super.key,
      required this.buttonText,
      required this.buttonOnPressed,
      this.fillColor = true});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonOnPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: fillColor ? null : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: fillColor ? null : const BorderSide(color: Colors.white),
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.79,
          MediaQuery.of(context).size.height * 0.06,
        ),
      ),
      child: Text(
        buttonText,
        style: Get.isDarkMode
            ? darkTheme.textTheme.displayMedium
            : lightTheme.textTheme.displayMedium,
      ),
    );
  }
}
