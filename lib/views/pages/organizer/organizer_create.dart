import 'package:flutter/material.dart';

import '../../widgets/shared_widgets/layout/custom_appbar.dart';
import '../../widgets/shared_widgets/layout/custom_navbar.dart';

class OrganizerCreate extends StatelessWidget {
  const OrganizerCreate({super.key});

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
              title: 'Create Event',
            ),
          ),
          body: Center(
            child: Text('Create Event'),
          ),
          bottomNavigationBar: CustomNavBar(
            selectedIndex: 1,
            currentTheme: ThemeMode.dark,
            isOrganizer: true,
          ),
        ),
      ),
    );
  }
}
