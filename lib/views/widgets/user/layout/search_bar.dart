import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoufibokra/consts/app_style.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';

class UserSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const UserSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.03,
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? AppColors.THIRD_DARK_COLOR
                : AppColors.THIRD_LIGHT_COLOR,
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                onChanged: onChanged,
                style: Get.isDarkMode
                    ? darkTheme.textTheme.displaySmall
                    : lightTheme.textTheme.displaySmall,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.06,
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
              AddHorizontalSpace(
                  width: MediaQuery.of(context).size.width * 0.03),
              Container(
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? AppColors.DARK_ACCENT_COLOR
                        : AppColors.LIGHT_ACCENT_COLOR,
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                  icon: const Icon(
                    Icons.filter_list,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
