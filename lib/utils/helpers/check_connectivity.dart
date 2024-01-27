import 'package:get/get.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../controllers/users_controllers/update_profile_controller.dart';
import 'package:shoufibokra/services/location_services/getting_location.dart';
import 'package:shoufibokra/controllers/shared_controllers/auth_services/logged_in_status_controller.dart';

Future<String> checkNetwrokStatues() async {
  final isConnected = await ConnectivityWrapper.instance.isConnected;
  final loggedInController = Get.find<LoggedInStatus>();
  final locationController = Get.find<LocationController>();
  final updateProfileController = Get.find<UpdateProfileController>();
  if (isConnected) {
    FlutterNativeSplash.remove();
    String route = loggedInController.checkLoggedInStatus();
    if (route == '/user_home') {
      updateProfileController.fetchCurrentUser();
      locationController.determinePosition();
    }
    return route;
  } else {
    FlutterNativeSplash.remove();
    return '/error_splash_screen';
  }
}

// || route == '/organizer_home'