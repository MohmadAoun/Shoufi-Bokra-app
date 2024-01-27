import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shoufibokra/consts/app_style.dart';

class ImageHelper extends GetxService {
  final ImagePicker _imagePicker = ImagePicker();
  final ImageCropper _imageCropper = ImageCropper();

  Future<XFile?> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
  }) async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: source,
        imageQuality: imageQuality,
      );
      return pickedFile;
    } catch (e) {
      log('Error picking image: $e');
      return null;
    }
  }

  Future<CroppedFile?> crop({
    required XFile file,
    CropStyle cropStyle = CropStyle.circle,
  }) async {
    try {
      final croppedFile = await _imageCropper.cropImage(
        sourcePath: file.path,
        cropStyle: cropStyle,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Get.isDarkMode
                ? AppColors.DARK_ACCENT_COLOR
                : AppColors.LIGHT_ACCENT_COLOR,
            toolbarWidgetColor: Get.isDarkMode
                ? AppColors.PRIMARY_DARK_COLOR
                : AppColors.PRIMARY_LIGHT_COLOR,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
            hideBottomControls: true,
            activeControlsWidgetColor: Colors.red,
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
        compressQuality: 25,
      );
      return croppedFile;
    } catch (e) {
      log('Error cropping image: $e');
      return null;
    }
  }
}
