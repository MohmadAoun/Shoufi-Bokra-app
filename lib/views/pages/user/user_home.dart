import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoufibokra/consts/app_style.dart';
import 'package:shoufibokra/views/widgets/user/event%20widgets/title_text_widget.dart';
import '../../widgets/user/layout/search_bar.dart';
import '../../widgets/shared_widgets/layout/custom_appbar.dart';
import '../../widgets/shared_widgets/layout/custom_navbar.dart';
import '../../widgets/user/layout/genre_selecter.dart';
import '../../widgets/user/event widgets/event_card.dart';
import '../../widgets/user/layout/user_profile_image.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import '../../../controllers/shared_controllers/theme_controller.dart';
import 'package:shoufibokra/views/widgets/user/event%20widgets/trending_event_carousel.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final TextEditingController controller = TextEditingController();

    Rx<int> index = Rx<int>(0);
    return SafeArea(
        child: PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.06),
            child: CustomAppBar(
                color: Get.isDarkMode
                    ? AppColors.THIRD_DARK_COLOR
                    : AppColors.THIRD_LIGHT_COLOR,
                actions: const [
                  Padding(
                      padding: EdgeInsets.all(8.0), child: UserProfileImage())
                ])),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserSearchBar(
                controller: controller,
                onChanged: (value) {},
              ),
              AddVerticalSpace(
                  height: MediaQuery.of(context).size.height * 0.01),
              const TitleText(title: 'Trending Events'),
              AddVerticalSpace(
                  height: MediaQuery.of(context).size.height * 0.01),
              const TrendingEventsCarousel(
                imagesUrl: [
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/D%C3%BClmen%2C_D%C3%BClmener_Sommer%2C_Open-Air-Konzert%2C_%22Bounce%22_--_2018_--_0051.jpg/800px-D%C3%BClmen%2C_D%C3%BClmener_Sommer%2C_Open-Air-Konzert%2C_%22Bounce%22_--_2018_--_0051.jpg',
                  'https://seattlerefined.com/resources/media2/16x9/full/1015/center/80/55fa1942-e1cf-4976-b45b-db3f2c784ca1-large16x9_IMG5871.jpg',
                  'https://wallpapers.com/images/hd/concert-background-dd0syeox7rmi78l0.jpg',
                  'https://img.etimg.com/thumb/width-1200,height-1200,imgsize-356679,resizemode-75,msid-49702777/magazines/panache/list-of-the-most-crowded-music-concerts-in-history.jpg',
                ],
              ),
              AddVerticalSpace(
                  height: MediaQuery.of(context).size.height * 0.01),
              const TitleText(title: 'All Events'),
              AddVerticalSpace(
                  height: MediaQuery.of(context).size.height * 0.01),
              Obx(
                () => GenreSelectorRow(
                  titles: const ['All', 'Movies', 'Food', 'Sports'],
                  icons: const [
                    Icons.all_inclusive,
                    Icons.movie,
                    Icons.food_bank,
                    Icons.sports
                  ],
                  onPressed: [
                    () {
                      index.value = 0;
                    },
                    () {
                      index.value = 1;
                    },
                    () {
                      index.value = 2;
                    },
                    () {
                      index.value = 3;
                    },
                  ],
                  selectedIndex: index.value,
                  currentTheme: themeController.currentTheme.value,
                ),
              ),
              AddVerticalSpace(
                  height: MediaQuery.of(context).size.height * 0.01),
              Flexible(
                fit: FlexFit.loose,
                child: Obx(
                  () => EventCard(
                    eventTitles: const [
                      'Once upon at ime in hollywood',
                      '2',
                      '3',
                      '4',
                      '5',
                    ],
                    imagesUrl: const [
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/D%C3%BClmen%2C_D%C3%BClmener_Sommer%2C_Open-Air-Konzert%2C_%22Bounce%22_--_2018_--_0051.jpg/800px-D%C3%BClmen%2C_D%C3%BClmener_Sommer%2C_Open-Air-Konzert%2C_%22Bounce%22_--_2018_--_0051.jpg',
                      'https://seattlerefined.com/resources/media2/16x9/full/1015/center/80/55fa1942-e1cf-4976-b45b-db3f2c784ca1-large16x9_IMG5871.jpg',
                      'https://wallpapers.com/images/hd/concert-background-dd0syeox7rmi78l0.jpg',
                      'https://img.etimg.com/thumb/width-1200,height-1200,imgsize-356679,resizemode-75,msid-49702777/magazines/panache/list-of-the-most-crowded-music-concerts-in-history.jpg',
                      'https://aghaniaghani.com/media/k2/galleries/17735/IMG-20220718-WA0093.jpg',
                    ],
                    currentTheme: themeController.currentTheme.value,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavBar(
          selectedIndex: 0,
          currentTheme: themeController.currentTheme.value,
        ),
      ),
    ));
  }
}
