import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoufibokra/services/location_services/getting_location.dart';
import '../../../consts/app_urls.dart';
import 'package:http/http.dart' as http;
import '../../../utils/helpers/get_snackbar.dart';
import '../../../views/pages/user/user_home.dart';
import '../../../services/get_storage/get_storage.dart';
import '../../../views/pages/organizer/organizer_home.dart';
import '../../users_controllers/update_profile_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final updateProfileController = Get.find<UpdateProfileController>();
  final locatoinController = Get.find<LocationController>();
  StorageService storage = Get.find<StorageService>();
  Rx<bool> isLoading = Rx<bool>(false);
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  Future<void> login() async {
    isLoading.value = true;
    var user = {
      "phone_number": phoneNumber.text,
      "password": password.text,
    };
    try {
      var response = await http.post(
        Uri.parse(AppUrl.LOGIN_URL),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user),
      );
      var jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var myToken = jsonResponse['token'];
        storage.isLoggedIn = true;
        storage.token = myToken;
        storage.user = jsonResponse['user'];
        phoneNumber.clear();
        password.clear();
        if (jsonResponse['user']['role'] == 'User') {
          storage.role = 'User';
          successSnackBar('logging in');
          updateProfileController.fetchCurrentUser();
          locatoinController.determinePosition();
          Get.offAll(() => const UserHomePage());
        } else {
          storage.role = 'Organizer';
          successSnackBar('logging in');
          updateProfileController.fetchCurrentUser();
          locatoinController.determinePosition();
          Get.offAll(() => const OrganizerHome());
        }
      } else if (response.statusCode == 404) {
        errorSnackBar(
          'No account was found for this phone number please register first or check phone number',
        );
      } else if (response.statusCode == 401) {
        errorSnackBar('Password is not correct');
      } else {
        errorSnackBar('error: ${response.statusCode.toString()}');
      }
    } catch (e) {
      errorSnackBar('Network error: $e');
    }
    isLoading.value = false;
  }
}
