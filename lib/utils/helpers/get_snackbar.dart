import 'package:get/get.dart';
import 'package:flutter/material.dart';

void errorSnackBar(String message) {
  Get.snackbar(
    'Error',
    message,
    backgroundColor: Colors.red,
    colorText: Colors.black,
  );
}

void successSnackBar(String message) {
  Get.snackbar(
    'success',
    message,
    backgroundColor: Colors.green,
    colorText: Colors.black,
  );
}
