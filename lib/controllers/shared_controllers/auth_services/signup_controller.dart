import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoufibokra/consts/app_urls.dart';
import 'package:shoufibokra/utils/helpers/get_snackbar.dart';
import 'package:shoufibokra/views/pages/shared_pages/login_page.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  RxBool visible = false.obs;
  Rx<bool> isLoading = Rx<bool>(false);
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final displayName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final role = TextEditingController();

  Future<void> singup() async {
    isLoading.value = true;
    var user = {
      "first_name": firstName.text,
      "last_name": lastName.text,
      'display_name': displayName.text,
      "phone_number": phoneNumber.text,
      "password": password.text,
      "role": role.text
    };
    try {
      var response = await http.post(
        Uri.parse(AppUrl.REGISTRATION_URL),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user),
      );
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        successSnackBar('Account created successfully, please log in now!');
        firstName.clear();
        lastName.clear();
        displayName.clear();
        phoneNumber.clear();
        password.clear();
        Get.to(() => const LogInPage());
      } else if (response.statusCode == 400) {
        if (jsonResponse['errors'] is List) {
          errorSnackBar(jsonResponse['errors'].join('\n'));
        } else {
          errorSnackBar(jsonResponse['errors']);
        }
      } else {
        errorSnackBar('Error: ${response.statusCode.toString()}');
      }
    } catch (e) {
      log(e.toString());
      errorSnackBar("Network error: $e");
    }
    isLoading.value = false;
  }
}
