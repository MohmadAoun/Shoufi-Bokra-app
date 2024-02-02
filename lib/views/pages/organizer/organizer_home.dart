import 'package:flutter/material.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/layout/custom_appbar.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/layout/custom_navbar.dart';
import 'package:shoufibokra/views/widgets/user/event%20widgets/event_card.dart';

class OrganizerHome extends StatelessWidget {
  const OrganizerHome({super.key});

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
              title: 'Home',
            ),
          ),
          body: Placeholder(),
          // body: Center(
          //   child:EventCard(eventTitles: , imagesUrl: , currentTheme: ),
          // ),
          bottomNavigationBar: CustomNavBar(
            selectedIndex: 0,
            currentTheme: ThemeMode.dark,
            isOrganizer: true,
          ),
        ),
      ),
    );
  }
}
