import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoufibokra/consts/app_style.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';

class PermissionDialog extends StatelessWidget {
  final String title;
  final String content;
  const PermissionDialog(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Get.isDarkMode
          ? AppColors.PRIMARY_DARK_COLOR
          : AppColors.PRIMARY_LIGHT_COLOR,
      title: Text(title),
      content: Text(content),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextButton(
                style: Get.isDarkMode
                    ? darkTheme.textButtonTheme.style
                    : lightTheme.textButtonTheme.style,
                child: Text(
                  'Settings',
                  style: Get.isDarkMode
                      ? darkTheme.textTheme.bodyMedium
                      : lightTheme.textTheme.bodyMedium,
                ),
                onPressed: () => Get.back(result: true),
              ),
            ),
            AddHorizontalSpace(width: MediaQuery.of(context).size.width * 0.03),
            Expanded(
              child: TextButton(
                style: Get.isDarkMode
                    ? darkTheme.textButtonTheme.style
                    : lightTheme.textButtonTheme.style,
                child: Text(
                  'Cancel',
                  style: Get.isDarkMode
                      ? darkTheme.textTheme.bodyMedium
                      : lightTheme.textTheme.bodyMedium,
                ),
                onPressed: () => Get.back(result: false),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
