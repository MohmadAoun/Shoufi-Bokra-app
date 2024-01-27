import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/users/user_model.dart';
import '../../utils/helpers/get_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoufibokra/consts/app_urls.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shoufibokra/consts/app_style.dart';

class UpdateProfileController extends GetxController {
  late XFile profileImage;
  Rx<bool> selectedImage = Rx<bool>(false);
  Rx<bool> changedFields = Rx<bool>(false);
  Rx<bool> isLoading = Rx<bool>(false);
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  late User currentUser;

  Future<void> fetchCurrentUser() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.GETUSER_URL),
          headers: {'Authorization': 'Bearer ${storage.token}'});

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        currentUser = User.fromJson(jsonData as Map<String, dynamic>);
        storage.firstName = currentUser.firstName;
        storage.lastName = currentUser.lastName;
        storage.phoneNumber =
            currentUser.phoneNumber.toString().padLeft(10, '0');
        storage.profileImageUrl = currentUser.profileImageUrl != ''
            ? '${AppUrl.IMAGEPREFIX_URL}${currentUser.profileImageUrl}'
            : '';
        firstName.text = storage.firstName!;
        lastName.text = storage.lastName!;
        phoneNumber.text = storage.phoneNumber!;
      } else {
        errorSnackBar('Failed to load user ${response.statusCode}');
      }
    } catch (e) {
      errorSnackBar('Network error: $e');
    }
  }

  Future<void> updateProfile(CroppedFile? profileImage) async {
    isLoading.value = true;
    try {
      if (firstName.text == storage.firstName &&
          lastName.text == storage.lastName &&
          phoneNumber.text == storage.phoneNumber &&
          !selectedImage.value) {
        changedFields.value = false;
      } else {
        changedFields.value = true;
      }
      if (changedFields.value) {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(AppUrl.UPDATEPROFILE_URL),
        );
        request.headers['Authorization'] = 'Bearer ${storage.token}';
        request.headers['Content-Type'] = 'multipart/form-data';
        request.fields['first_name'] = firstName.text;
        request.fields['last_name'] = lastName.text;
        request.fields['phone_number'] = phoneNumber.text;
        selectedImage.value
            ? request.files.add(
                await http.MultipartFile.fromPath(
                  'profile_image',
                  profileImage!.path,
                ),
              )
            : null;
        var response = await request.send();
        if (response.statusCode == 200) {
          successSnackBar('Profile updated successfully');
          fetchCurrentUser();
          var responseBody = await response.stream.bytesToString();
          var jsonResponse = jsonDecode(responseBody);
          storage.user = jsonResponse['user'];
        } else if (response.statusCode == 400) {
          var responseBody = await response.stream.bytesToString();
          var jsonResponse = jsonDecode(responseBody);
          var validationErrors = jsonResponse['errors'];
          errorSnackBar(validationErrors[0]);
        } else {
          errorSnackBar('failed to update profile');
        }
      } else {
        errorSnackBar(
            'Please make some changes before trying to update profile');
      }
    } catch (e) {
      errorSnackBar('Network error: $e');
    }

    isLoading.value = false;
  }
}
