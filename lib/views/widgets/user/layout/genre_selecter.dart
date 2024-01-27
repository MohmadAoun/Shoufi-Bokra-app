import 'package:flutter/material.dart';
import 'package:shoufibokra/consts/app_style.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';

class GenreSelectorRow extends StatelessWidget {
  final List<String> titles;
  final List<IconData> icons;
  final List<void Function()> onPressed;
  final int selectedIndex;
  final ThemeMode currentTheme;

  const GenreSelectorRow({
    super.key,
    required this.titles,
    required this.icons,
    required this.onPressed,
    required this.selectedIndex,
    required this.currentTheme,
  });

  @override
  Widget build(BuildContext context) {
    final itemCount = titles.length;

    Widget buildIconContainer(int index, bool isSelected) {
      final selectedColor = currentTheme == ThemeMode.dark
          ? AppColors.THIRD_DARK_COLOR
          : AppColors.THIRD_LIGHT_COLOR;
      final unselectedColor = currentTheme == ThemeMode.dark
          ? AppColors.PRIMARY_DARK_COLOR
          : AppColors.LIGHT_ACCENT_COLOR;

      final iconBackgroundColor = isSelected ? selectedColor : unselectedColor;

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: iconBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            icons[index],
            color: currentTheme == ThemeMode.dark
                ? AppColors.SECONDARY_DARK_COLOR
                : AppColors.SECONDARY_LIGHT_COLOR,
            size: 15,
          ),
        ),
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          final isSelected = index == selectedIndex;
          return Container(
            margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: ElevatedButton.icon(
              onPressed: isSelected ? null : onPressed[index],
              icon: Padding(
                padding: const EdgeInsets.all(0.0),
                child: buildIconContainer(index, isSelected),
              ),
              label: Text(
                titles[index],
                style: currentTheme == ThemeMode.dark
                    ? darkTheme.textTheme.bodySmall
                    : lightTheme.textTheme.bodySmall,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return currentTheme == ThemeMode.dark
                          ? AppColors.DARK_ACCENT_COLOR
                          : AppColors.LIGHT_ACCENT_COLOR;
                    } else if (index == selectedIndex) {
                      return currentTheme == ThemeMode.dark
                          ? AppColors.DARK_ACCENT_COLOR
                          : AppColors.LIGHT_ACCENT_COLOR;
                    } else {
                      return currentTheme == ThemeMode.dark
                          ? AppColors.THIRD_DARK_COLOR
                          : AppColors.THIRD_LIGHT_COLOR;
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
