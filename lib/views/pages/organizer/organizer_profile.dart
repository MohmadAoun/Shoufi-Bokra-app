import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoufibokra/views/pages/shared_pages/welcome_page.dart';

import '../../widgets/shared_widgets/layout/custom_appbar.dart';
import '../../widgets/shared_widgets/layout/custom_navbar.dart';

class OrganizerProfile extends StatelessWidget {
  const OrganizerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.06,
            ),
            child: const CustomAppBar(
              title: 'Profile',
            ),
          ),
          body: Center(
            child: IconButton(
              icon: const Icon(
                Icons.login,
                color: Colors.black,
              ),
              onPressed: () {
                Get.offAll(() => const WelcomePage());
              },
            ),
          ),
          bottomNavigationBar: CustomNavBar(
            selectedIndex: 2,
            currentTheme: ThemeMode.dark,
            isOrganizer: true,
          ),
        ),
      ),
    );
  }
}
