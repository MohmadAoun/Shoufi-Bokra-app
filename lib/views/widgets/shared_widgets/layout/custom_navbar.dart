import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shoufibokra/consts/app_style.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shoufibokra/views/pages/organizer/organizer_create.dart';
import 'package:shoufibokra/views/pages/organizer/organizer_home.dart';
import 'package:shoufibokra/views/pages/organizer/organizer_profile.dart';
import 'package:shoufibokra/views/pages/user/user_home.dart';
import 'package:shoufibokra/views/pages/user/user_profile.dart';
import 'package:shoufibokra/views/pages/user/user_my_tickets.dart';
import 'package:shoufibokra/views/pages/user/user_favorite.dart';

import '../../../../consts/app_icons.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ThemeMode currentTheme;
  final bool isOrganizer;
  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.currentTheme,
    this.isOrganizer = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = currentTheme == ThemeMode.dark
        ? AppColors.LIGHT_ACCENT_COLOR.withOpacity(0.8)
        : AppColors.THIRD_LIGHT_COLOR.withOpacity(0.8);
    final color = currentTheme == ThemeMode.dark
        ? AppColors.SECONDARY_DARK_COLOR
        : AppColors.SECONDARY_LIGHT_COLOR;
    final activeColor = currentTheme == ThemeMode.dark
        ? AppColors.DARK_ACCENT_COLOR
        : AppColors.LIGHT_ACCENT_COLOR;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: GNav(
          selectedIndex: selectedIndex,
          onTabChange: (index) => {},
          backgroundColor: backgroundColor,
          haptic: true,
          curve: Curves.elasticIn,
          duration: const Duration(milliseconds: 100),
          color: color,
          activeColor: activeColor,
          iconSize: MediaQuery.of(context).size.width * 0.08,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.08,
          ),
          tabs: isOrganizer
              ? [
                  GButton(
                    icon: ShoufiBokraIcons.home,
                    onPressed: () {
                      Get.off(() => const OrganizerHome());
                    },
                  ),
                  GButton(
                    icon: ShoufiBokraIcons.create_icon,
                    onPressed: () {
                      Get.off(() => const OrganizerCreate());
                    },
                  ),
                  GButton(
                    icon: ShoufiBokraIcons.user,
                    onPressed: () {
                      Get.off(() => const OrganizerProfile());
                    },
                  ),
                ]
              : [
                  GButton(
                    icon: Icons.home,
                    onPressed: () => {Get.off(() => const UserHomePage())},
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    onPressed: () => {Get.off(() => const UserFavortiePage())},
                  ),
                  GButton(
                    icon: LineIcons.alternateTicket,
                    onPressed: () => {Get.off(() => const UserTicketsPage())},
                  ),
                  GButton(
                    icon: Icons.account_circle,
                    onPressed: () => {Get.off(() => const UserProfilePage())},
                  ),
                ]),
    );
  }
}
