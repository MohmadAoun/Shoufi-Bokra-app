import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../utils/helpers/get_snackbar.dart';
import 'package:shoufibokra/consts/app_style.dart';
import '../../widgets/shared_widgets/layout/custom_navbar.dart';
import '../../widgets/shared_widgets/layout/custom_appbar.dart';
import '../../widgets/user/layout/user_textbutton.dart';
import '../../../services/get_storage/get_storage.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shoufibokra/views/pages/user/user_update_profile.dart';
import 'package:shoufibokra/views/pages/shared_pages/welcome_page.dart';
import 'package:shoufibokra/controllers/shared_controllers/theme_controller.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<StorageService>();
    final themeController = Get.find<ThemeController>();
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.06,
            ),
            child: const CustomAppBar(
              title: 'Profile',
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Center(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: CircleAvatar(
                          backgroundColor: themeController.currentTheme.value ==
                                  ThemeMode.dark
                              ? AppColors.DARK_ACCENT_COLOR
                              : AppColors.LIGHT_ACCENT_COLOR,
                          maxRadius: 70,
                          child: storage.profileImageUrl == ''
                              ? Image(
                                  image: AssetImage(
                                    themeController.profileImage.value,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                )
                              : ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: storage.profileImageUrl as String,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) {
                                      errorSnackBar(
                                          'Failed to load image $error');
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  AddVerticalSpace(
                      height: MediaQuery.of(context).size.height / 40),
                  Obx(
                    () => Text(
                      'Name: ${storage.firstName} ${storage.lastName}',
                    ),
                  ),
                  Obx(
                    () => Text(
                      'Number: ${storage.phoneNumber}',
                    ),
                  ),
                  AddVerticalSpace(
                      height: MediaQuery.of(context).size.height / 80),
                  Obx(
                    () => UserTextButton(
                        onPressed: () {
                          Get.to(() => const UpdateProfilePage());
                        },
                        text: 'Edit Profile',
                        icon: Icons.edit,
                        currentTheme: themeController.currentTheme.value),
                  ),
                  AddVerticalSpace(
                      height: MediaQuery.of(context).size.height / 80),
                  Obx(
                    () => UserTextButton(
                        onPressed: () {},
                        text: 'Billing Details',
                        icon: Icons.wallet,
                        currentTheme: themeController.currentTheme.value),
                  ),
                  AddVerticalSpace(
                      height: MediaQuery.of(context).size.height / 80),
                  Obx(
                    () => UserTextButton(
                        onPressed: () {
                          storage.savedTheme = true;
                          if (Get.isDarkMode) {
                            storage.theme = ThemeMode.light;
                            Get.changeThemeMode(ThemeMode.light);
                          } else {
                            storage.theme = ThemeMode.dark;
                            Get.changeThemeMode(ThemeMode.dark);
                          }
                          themeController.changeProfileImage();
                        },
                        text: 'Change Theme',
                        icon: Icons.dark_mode,
                        currentTheme: themeController.currentTheme.value),
                  ),
                  AddVerticalSpace(
                      height: MediaQuery.of(context).size.height / 80),
                  Obx(
                    () => UserTextButton(
                        onPressed: () {
                          storage.isLoggedIn = false;
                          storage.role = '';
                          storage.token = '';
                          storage.user = {};
                          Get.offAll(() => const WelcomePage());
                        },
                        text: 'Log Out',
                        icon: Icons.logout,
                        currentTheme: themeController.currentTheme.value),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Obx(
            () => CustomNavBar(
                selectedIndex: 3,
                currentTheme: themeController.currentTheme.value),
          ),
        ),
      ),
    );
  }
}
