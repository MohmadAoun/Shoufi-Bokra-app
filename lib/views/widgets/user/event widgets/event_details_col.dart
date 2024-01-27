import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../utils/themes/app_themes.dart';
import '../../../../utils/helpers/add_sized_box.dart';

class EventDetailsCol extends StatelessWidget {
  final String eventTitle;
  final String eventDate;
  final String eventTime;
  final String eventLocation;
  final String eventPrice;
  final String eventDescription;
  const EventDetailsCol({
    super.key,
    required this.eventDate,
    required this.eventTime,
    required this.eventLocation,
    required this.eventPrice,
    required this.eventTitle,
    required this.eventDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          eventTitle.tr,
          style: Get.isDarkMode
              ? darkTheme.textTheme.displayLarge
              : lightTheme.textTheme.displayLarge,
        ),
        const AddHorizontalSpace(width: 8),
        Row(
          children: [
            const LineIcon(
              LineIcons.calendar,
            ),
            const AddHorizontalSpace(width: 8),
            Flexible(
              child: Text(
                eventDate.tr,
                style: Get.isDarkMode
                    ? darkTheme.textTheme.displayMedium
                    : lightTheme.textTheme.displayMedium,
              ),
            ),
          ],
        ),
        const AddVerticalSpace(height: 5),
        Row(
          children: [
            const LineIcon(
              LineIcons.clock,
            ),
            const AddHorizontalSpace(width: 8),
            Flexible(
              child: Text(
                eventTime.tr,
                style: Get.isDarkMode
                    ? darkTheme.textTheme.displayMedium
                    : lightTheme.textTheme.displayMedium,
              ),
            ),
          ],
        ),
        const AddVerticalSpace(height: 5),
        Row(
          children: [
            const Icon(
              Icons.location_on,
            ),
            const AddHorizontalSpace(width: 8),
            Flexible(
              child: Text(
                eventLocation.tr,
                style: Get.isDarkMode
                    ? darkTheme.textTheme.displayMedium
                    : lightTheme.textTheme.displayMedium,
              ),
            ),
          ],
        ),
        const AddVerticalSpace(height: 5),
        Row(
          children: [
            const LineIcon(
              LineIcons.dollarSign,
            ),
            const AddHorizontalSpace(width: 8),
            Flexible(
              child: Text(
                eventPrice,
                style: Get.isDarkMode
                    ? darkTheme.textTheme.displayMedium
                    : lightTheme.textTheme.displayMedium,
              ),
            ),
          ],
        ),
        const AddVerticalSpace(height: 5),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: Get.isDarkMode
                ? darkTheme.textTheme.displayMedium
                : lightTheme.textTheme.bodyMedium,
            children: [
              const TextSpan(
                text: 'About this event: ',
              ),
              TextSpan(
                text: eventDescription,
                style: Get.isDarkMode
                    ? darkTheme.textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w100,
                      )
                    : lightTheme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w100,
                      ),
              ),
            ],
          ),
        ),
        const AddVerticalSpace(height: 65)
      ],
    );
  }
}
