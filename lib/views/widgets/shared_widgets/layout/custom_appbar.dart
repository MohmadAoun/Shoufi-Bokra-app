import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';
import '../../../../services/location_services/getting_location.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final Color color;
  final Widget? leading;
  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions = const [],
    this.color = Colors.transparent,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final LocationController locationController =
        Get.find<LocationController>();
    return AppBar(
      automaticallyImplyLeading: false,
      title: title == ''
          ? Obx(() {
              final city = locationController.city.value;
              final country = locationController.country.value;
              return city.isNotEmpty && country.isNotEmpty
                  ? Text(
                      '$city, $country',
                      style: Get.isDarkMode
                          ? darkTheme.textTheme.displaySmall
                          : lightTheme.textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.snackbar('Location', 'Trying to get location');
                        locationController.determinePosition();
                      },
                      child: Text(
                        'Retry Get location',
                        style: Get.isDarkMode
                            ? darkTheme.textTheme.displaySmall
                            : lightTheme.textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                    );
            })
          : Text(
              title,
              style: Get.isDarkMode
                  ? darkTheme.textTheme.displayMedium
                  : lightTheme.textTheme.displayMedium,
            ),
      actions: actions,
      leading: leading,
      centerTitle: true,
      titleTextStyle: Theme.of(context).textTheme.displayMedium,
      backgroundColor: color,
    );
  }
}
