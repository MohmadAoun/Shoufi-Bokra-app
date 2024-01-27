import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'utils/bindings/initial_bindings.dart';
import 'services/get_storage/get_storage.dart';
import 'views/pages/shared_pages/welcome_page.dart';
import 'services/location_services/getting_location.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';
import 'package:shoufibokra/views/pages/user/user_home.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shoufibokra/utils/helpers/check_connectivity.dart';
import 'package:shoufibokra/views/pages/organizer/organizer_home.dart';
import 'package:shoufibokra/views/pages/shared_pages/error_splash_page.dart';
import 'package:shoufibokra/controllers/shared_controllers/theme_controller.dart';
import 'package:shoufibokra/controllers/users_controllers/update_profile_controller.dart';
import 'package:shoufibokra/controllers/shared_controllers/auth_services/logged_in_status_controller.dart';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(StorageService());
  final themeController = Get.put(ThemeController());
  Get.put(LoggedInStatus());
  Get.put(LocationController());
  Get.put(UpdateProfileController());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeController.checkTheme(),
      title: 'Shoufi Bokra ?',
      // translations: AppTranslation(),
      locale: const Locale('en', 'us'),
      fallbackLocale: const Locale('ar', 'sy'),
      routes: {
        '/': (context) => const WelcomePage(),
        '/user_home': (context) => const UserHomePage(),
        '/error_splash_screen': (context) => const ErrorSplashScreen(),
        '/organizer_home': (context) => const OrganizerHome()
      },
      initialRoute: await checkNetwrokStatues(),
      initialBinding: InitialBindings(),
    ),
  );
}
