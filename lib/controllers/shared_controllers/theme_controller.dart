import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoufibokra/consts/app_images.dart';
import 'package:shoufibokra/services/get_storage/get_storage.dart';

class ThemeController extends GetxController {
  Rx<String> profileImage = Rx<String>(AppImages.USER_ICON_LIGHT);
  Rx<ThemeMode> currentTheme = Rx<ThemeMode>(ThemeMode.system);
  final storage = Get.find<StorageService>();

  changeProfileImage() {
    Get.isDarkMode
        ? profileImage.value = AppImages.USER_ICON_LIGHT
        : profileImage.value = AppImages.USER_ICON_DARK;

    currentTheme.value = storage.theme;
  }

  checkTheme() {
    if (storage.savedTheme) {
      currentTheme.value = storage.theme;
      return storage.theme;
    } else {
      return ThemeMode.system;
    }
  }
}
