import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoufibokra/consts/app_style.dart';
import '../../../../utils/helpers/get_snackbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shoufibokra/controllers/shared_controllers/theme_controller.dart';

import '../../../pages/user/user_profile.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GestureDetector(
      onTap: () {
        Get.to(() => const UserProfilePage());
      },
      child: Obx(
        () => Center(
          child: FittedBox(
            fit: BoxFit.cover,
            child: CircleAvatar(
              backgroundColor:
                  themeController.currentTheme.value == ThemeMode.dark
                      ? AppColors.DARK_ACCENT_COLOR
                      : AppColors.LIGHT_ACCENT_COLOR,
              maxRadius: 70,
              child: storage.profileImageUrl == ''
                  ? Image(
                      image: AssetImage(
                        themeController.profileImage.value,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.1,
                    )
                  : ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: storage.profileImageUrl as String,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
                          errorSnackBar('Failed to load image $error');
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
