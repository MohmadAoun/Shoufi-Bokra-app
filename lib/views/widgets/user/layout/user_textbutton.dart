import 'package:flutter/material.dart';
import '../../../../utils/helpers/add_sized_box.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';

class UserTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final ThemeMode currentTheme;
  const UserTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon,
      required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: currentTheme == ThemeMode.dark
          ? darkTheme.textButtonTheme.style!.copyWith(
              fixedSize: MaterialStatePropertyAll(Size(
              MediaQuery.of(context).size.width * 0.79,
              MediaQuery.of(context).size.height * 0.06,
            )))
          : lightTheme.textButtonTheme.style!.copyWith(
              fixedSize: MaterialStatePropertyAll(Size(
              MediaQuery.of(context).size.width * 0.79,
              MediaQuery.of(context).size.height * 0.06,
            ))),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AddHorizontalSpace(width: 10),
          Text(
            text,
            style: currentTheme == ThemeMode.dark
                ? darkTheme.textTheme.displayMedium
                : lightTheme.textTheme.displayMedium,
          ),
          Icon(icon),
        ],
      ),
    );
  }
}
