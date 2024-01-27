import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../../utils/helpers/add_sized_box.dart';
import 'package:shoufibokra/consts/app_style.dart';
import '../../widgets/shared_widgets/layout/custom_appbar.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';
import '../../widgets/user/ticket widgets/ticket_data.dart';
import 'package:shoufibokra/utils/helpers/get_snackbar.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class UserTicketPage extends StatelessWidget {
  final String ticketTitle;
  final String imageUrl;
  final ThemeMode currentTheme;
  const UserTicketPage({
    super.key,
    required this.ticketTitle,
    required this.imageUrl,
    required this.currentTheme,
  });

  @override
  Widget build(BuildContext context) {
    ScreenshotController screenshotController = ScreenshotController();
    late Uint8List? imageFile;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.06,
          ),
          child: CustomAppBar(
            title: ticketTitle,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Screenshot(
                controller: screenshotController,
                child: TicketWidget(
                  isCornerRounded: true,
                  color: currentTheme == ThemeMode.dark
                      ? AppColors.DARK_ACCENT_COLOR
                      : AppColors.LIGHT_ACCENT_COLOR,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: TicketData(
                    currentTheme: currentTheme,
                    imageUrl: imageUrl,
                    eventTitle: ticketTitle,
                    eventDate: '23,Dec,2024',
                    eventLocatoin: 'قلعة دمشق',
                    eventTime: '8:00',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.45,
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                        Get.isDarkMode
                            ? AppColors.DARK_ACCENT_COLOR
                            : AppColors.LIGHT_ACCENT_COLOR,
                      ),
                    ),
                    onPressed: () async {
                      await screenshotController.capture().then(
                        (Uint8List? image) {
                          imageFile = image;
                        },
                      ).catchError((e) {
                        log(e.toString());
                      });
                      try {
                        final result = await ImageGallerySaver.saveImage(
                          imageFile!,
                        );
                        if (result['isSuccess']) {
                          successSnackBar('Image saved to gallery');
                        } else {
                          errorSnackBar('Error saving image to gallery');
                        }
                      } on PlatformException catch (error) {
                        errorSnackBar(
                            'Error saving image to gallery: ${error.toString()}');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.download),
                          Text(
                            'Image',
                            style: currentTheme == ThemeMode.dark
                                ? darkTheme.textTheme.displayMedium
                                : lightTheme.textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const AddHorizontalSpace(width: 8),
                  TextButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.45,
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                        Get.isDarkMode
                            ? AppColors.DARK_ACCENT_COLOR
                            : AppColors.LIGHT_ACCENT_COLOR,
                      ),
                    ),
                    onPressed: () {
                      Get.bottomSheet(
                        enableDrag: true,
                        backgroundColor: Colors.white.withOpacity(0.8),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: BarcodeWidget(
                            data: '837429837509863245',
                            barcode: Barcode.qrCode(),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.qr_code),
                          Text(
                            'Qr Code',
                            style: currentTheme == ThemeMode.dark
                                ? darkTheme.textTheme.displayMedium
                                : lightTheme.textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
