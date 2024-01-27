import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../consts/app_style.dart';
import 'package:shoufibokra/consts/app_images.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';
import 'package:shoufibokra/views/pages/user/user_event.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventCard extends StatelessWidget {
  final List<String> eventTitles;
  final List<String> imagesUrl;
  final ThemeMode currentTheme;

  const EventCard({
    super.key,
    required this.eventTitles,
    required this.imagesUrl,
    required this.currentTheme,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: eventTitles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => {
            Get.to(
              () => UserEventPage(
                eventTitle: eventTitles[index],
                imageUrl: imagesUrl[index],
              ),
            ),
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.transparent,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 0.9,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imagesUrl[index],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: currentTheme == ThemeMode.dark
                            ? AppColors.DARK_ACCENT_COLOR
                            : AppColors.LIGHT_ACCENT_COLOR,
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      log('${error.toString()} Happend with event : ${eventTitles[index]}');
                      return const Image(
                        image: AssetImage(
                          AppImages.APP_LOGO_LIGHT,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: currentTheme == ThemeMode.dark
                          ? AppColors.THIRD_DARK_COLOR.withOpacity(0.85)
                          : AppColors.THIRD_LIGHT_COLOR.withOpacity(0.85),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eventTitles[index].tr,
                            style: currentTheme == ThemeMode.dark
                                ? darkTheme.textTheme.displaySmall
                                : lightTheme.textTheme.displaySmall,
                          ),
                          const AddVerticalSpace(height: 5),
                          Text(
                            'Event location and date'.tr,
                            style: currentTheme == ThemeMode.dark
                                ? darkTheme.textTheme.bodySmall
                                : lightTheme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
