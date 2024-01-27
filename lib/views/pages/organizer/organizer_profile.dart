import 'package:flutter/material.dart';

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
            child: Text('test'),
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
