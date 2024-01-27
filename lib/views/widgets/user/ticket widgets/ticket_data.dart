import 'dart:developer';
import 'ticket_details_row.dart';
import 'package:flutter/material.dart';
import '../../../../consts/app_style.dart';
import '../../../../consts/app_images.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../../../../utils/helpers/dashed_divider.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TicketData extends StatelessWidget {
  final ThemeMode currentTheme;
  final String imageUrl;
  final String eventTitle;
  final String eventDate;
  final String eventTime;
  final String eventLocatoin;
  const TicketData({
    super.key,
    required this.currentTheme,
    required this.imageUrl,
    required this.eventTitle,
    required this.eventDate,
    required this.eventTime,
    required this.eventLocatoin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(19),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
              color: currentTheme == ThemeMode.dark
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
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
            child: Text(
              eventTitle,
              style: currentTheme == ThemeMode.dark
                  ? darkTheme.textTheme.bodyLarge
                  : lightTheme.textTheme.bodyLarge,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
          child: DashedDivider(
            color: currentTheme == ThemeMode.dark
                ? AppColors.THIRD_DARK_COLOR
                : AppColors.THIRD_LIGHT_COLOR,
            strokeWidth: 2.0,
            dashWidth: 10.0,
            dashGap: 5.0,
            height: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
          child: Column(
            children: [
              const TicketDetailsRow(titles: ['Date', 'Time'], title: true),
              TicketDetailsRow(titles: [eventDate, '$eventTime pm']),
              const TicketDetailsRow(titles: ['Venue', 'Seat'], title: true),
              TicketDetailsRow(titles: [eventLocatoin, 'no seat'])
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
          child: DashedDivider(
            color: currentTheme == ThemeMode.dark
                ? AppColors.THIRD_DARK_COLOR
                : AppColors.THIRD_LIGHT_COLOR,
            strokeWidth: 2.0,
            dashWidth: 10.0,
            dashGap: 5.0,
            height: 1.0,
          ),
        ),
        BarcodeWidget(
          drawText: false,
          data: '837429837509863245',
          barcode: Barcode.code128(),
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        const AddVerticalSpace(height: 4)
      ],
    );
  }
}
