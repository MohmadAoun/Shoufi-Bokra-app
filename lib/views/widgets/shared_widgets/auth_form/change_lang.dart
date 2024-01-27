import 'dart:developer';

// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';

// import '../../../utils/locale/storage.dart';

class LanguageToggler extends StatelessWidget {
  const LanguageToggler({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isEnglishSelected = true;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // isEnglishSelected = true;
              log('en');
            },
            child: const Text(
              'English',
              // style: isEnglishSelected
              //     ? lightTheme.textTheme.headlineSmall
              //     : Get.isDarkMode
              //         ? darkTheme.textTheme.bodySmall
              //         : lightTheme.textTheme.bodySmall,
            ),
          ),
          const AddHorizontalSpace(width: 10),
          GestureDetector(
            onTap: () {
              // isEnglishSelected = false;
              log('arabic');
            },
            child: Text(
              'العربية',
              style: Get.isDarkMode
                  ? darkTheme.textTheme.bodySmall
                  : lightTheme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
