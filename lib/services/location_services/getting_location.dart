import 'dart:convert';
import 'package:get/get.dart';
import '../../consts/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shoufibokra/utils/helpers/get_snackbar.dart';
import 'package:shoufibokra/views/dialogs/permision_dialog.dart';
import 'package:shoufibokra/controllers/shared_controllers/theme_controller.dart';

class LocationController extends GetxController {
  Rx<String> city = Rx<String>('');
  Rx<String> country = Rx<String>('');
  final Rx<Position?> position = Rx<Position?>(null);
  final themeController = Get.find<ThemeController>();
  Future<void> determinePosition() async {
    PermissionStatus permissionStatus = await Permission.location.status;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (permissionStatus.isPermanentlyDenied || permissionStatus.isDenied) {
      permissionStatus = await Permission.location.request();
      bool? openSettings = await Get.dialog<bool>(
        const PermissionDialog(
          title: 'Location Permission',
          content:
              'Locatoin Permission is permamntly denied please allow the app to use location',
        ),
      );
      openSettings!
          ? await openAppSettings()
          : errorSnackBar(
              'Please give the app the locatoin permission and try again',
            );
    } else {
      if (!serviceEnabled) {
        bool? openSettings = await Get.dialog(
          const PermissionDialog(
            title: 'Location service is disabled',
            content:
                'Location service is disabled,open settings to turn the location on',
          ),
        );
        openSettings!
            ? await Geolocator.openLocationSettings()
            : errorSnackBar(
                'Please turn location service on and try again',
              );
      } else {
        try {
          await getPosition();
        } catch (e) {
          errorSnackBar(e.toString());
        }
      }
    }
  }

  Future<void> getPosition() async {
    Position? lastKnownPostion = await Geolocator.getLastKnownPosition();
    if (lastKnownPostion != null) {
      position.value = lastKnownPostion;
      await updateAddress();
      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      position.value = currentPosition;
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      position.value = currentPosition;
    }
    await updateAddress();
  }

  Future<void> updateAddress() async {
    double lat = position.value!.latitude;
    double long = position.value!.longitude;
    try {
      if (position.value == null) {
        errorSnackBar('Position is not available');
        return;
      } else {
        final url =
            '${AppUrl.GEOCODING_BASE_URL}lat=$lat&lon=$long&api_key=${AppUrl.GEOCODING_API_KEY}';
        http.Response response = await http.get(
          Uri.parse(url),
        );

        if (response.statusCode == 200) {
          final decodedBody = jsonDecode(response.body);
          city.value = decodedBody['address']['state'];
          country.value = decodedBody['address']['country_code'];
        } else {
          errorSnackBar('Failed to get address: ${response.statusCode}');
        }
      }
    } catch (e) {
      errorSnackBar('Failed to update address $e');
    }
  }
}
