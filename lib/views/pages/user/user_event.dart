import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../consts/app_style.dart';
import '../../../consts/app_images.dart';
import '../../widgets/shared_widgets/layout/custom_appbar.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../widgets/user/event widgets/event_details_col.dart';

class UserEventPage extends StatelessWidget {
  final String eventTitle;
  final String imageUrl;
  const UserEventPage(
      {super.key, required this.eventTitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
              color: Get.isDarkMode
                  ? AppColors.DARK_ACCENT_COLOR
                  : AppColors.LIGHT_ACCENT_COLOR,
            ),
            errorWidget: (context, url, error) {
              log('${error.toString()} Happend with event : $eventTitle');
              return const Image(
                image: AssetImage(
                  AppImages.APP_LOGO_LIGHT,
                ),
              );
            },
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.06,
            ),
            child: CustomAppBar(
              title: eventTitle,
              color: Colors.black.withOpacity(0.2),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AddVerticalSpace(
                    height: MediaQuery.of(context).size.height * 0.395),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.isDarkMode
                        ? AppColors.DARK_ACCENT_COLOR.withOpacity(0.8)
                        : AppColors.SECONDARY_LIGHT_COLOR.withOpacity(0.8),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: EventDetailsCol(
                          eventTitle: eventTitle,
                          eventPrice: '10,000',
                          eventDate: '10/11/2024',
                          eventTime: '8:00 pm',
                          eventLocation: 'سوريا دمشق الشام القديمة قلعة دمشق',
                          eventDescription:
                              ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. asdfasdfa sdf asdfasdfsad asdfasdfas s',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Get.isDarkMode
                        ? AppColors.THIRD_DARK_COLOR.withOpacity(0.5)
                        : AppColors.THIRD_LIGHT_COLOR.withOpacity(0.5),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                    ),
                  ),
                ),
                const AddHorizontalSpace(width: 19),
                TextButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(
                        MediaQuery.of(context).size.width * 0.65,
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                      Get.isDarkMode
                          ? AppColors.DARK_ACCENT_COLOR
                          : AppColors.LIGHT_ACCENT_COLOR,
                    ),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Get Ticket',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
