import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../widgets/shared_widgets/layout/custom_appbar.dart';
import '../../widgets/shared_widgets/layout/custom_navbar.dart';
import '../../../controllers/shared_controllers/theme_controller.dart';
import 'package:shoufibokra/views/widgets/user/ticket%20widgets/ticket_card.dart';

class UserTicketsPage extends StatelessWidget {
  const UserTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return SafeArea(
        child: PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.06),
          child: const CustomAppBar(
            title: 'Tickets',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: UserTicketsCard(
            eventsTitles: const [
              'Once upon a time in hollywood sadjfkl jasdklfj',
              'Once upon a time in hollywood',
              'Once upon a time in hollywood',
              'Once upon a time in hollywood',
              'Once upon a time in hollywood',
              'Once upon a time in hollywood',
              'Once upon a time in hollywood',
              'Once upon a time in hollywood',
              'Once upon a time in hollywood',
              'Once upon a time in hollywood',
            ],
            imagesUrl: const [
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
              'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
            ],
            currentTheme: themeController.currentTheme.value,
            eventsDates: const [
              '22,Jan,2024',
              '22,Jan,2024',
              '22,Jan,2024',
              '22,Jan,2024',
              '22,Jan,2024',
              '22,Jan,2024',
              '22,Jan,2024',
              '22,Jan,2024',
              '22,Jan,2024',
              '22,Jan,2024',
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(
          selectedIndex: 2,
          currentTheme: themeController.currentTheme.value,
        ),
      ),
    ));
  }
}
