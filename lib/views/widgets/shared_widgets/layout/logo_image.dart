import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../consts/app_images.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        Get.isDarkMode ? AppImages.APP_LOGO_DARK : AppImages.APP_LOGO_LIGHT,
      ),
      width: MediaQuery.of(context).size.width * 0.6,
    );
  }
}
