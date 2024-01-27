import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoufibokra/views/pages/user/user_ticket_page.dart';
import '../../../../consts/app_style.dart';
import '../../../../consts/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserTicketsCard extends StatelessWidget {
  final List<String> eventsTitles;
  final List<String> eventsDates;
  final List<String> imagesUrl;
  final ThemeMode currentTheme;
  const UserTicketsCard({
    super.key,
    required this.eventsTitles,
    required this.imagesUrl,
    required this.currentTheme,
    required this.eventsDates,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: eventsTitles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => UserTicketPage(
                    ticketTitle: eventsTitles[index],
                    imageUrl: imagesUrl[index],
                    currentTheme: currentTheme,
                  ));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              color: currentTheme == ThemeMode.dark
                  ? AppColors.DARK_ACCENT_COLOR
                  : AppColors.LIGHT_ACCENT_COLOR,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imagesUrl[index],
                    width: MediaQuery.of(context).size.width * 0.4,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: currentTheme == ThemeMode.dark
                          ? AppColors.DARK_ACCENT_COLOR
                          : AppColors.LIGHT_ACCENT_COLOR,
                    ),
                    errorWidget: (context, url, error) {
                      log('${error.toString()} Happend with event : ${eventsTitles[index]}');
                      return const Image(
                        image: AssetImage(
                          AppImages.APP_LOGO_LIGHT,
                        ),
                      );
                    },
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eventsTitles[index],
                          ),
                          Text(
                            eventsDates[index],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
