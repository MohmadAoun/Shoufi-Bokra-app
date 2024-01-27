// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoufibokra/services/get_storage/get_storage.dart';

final storage = Get.put(StorageService());

class AppColors {
  static const Color PRIMARY_DARK_COLOR = Color(0xff161817);
  static const Color SECONDARY_DARK_COLOR = Color(0xffDAFFFB);
  static const Color THIRD_DARK_COLOR = Color(0xff2D2F2E);
  static const Color DARK_ACCENT_COLOR = Color(0xff64CCC5);

  static const Color PRIMARY_LIGHT_COLOR = Color(0xffF7EFE5);
  static const Color SECONDARY_LIGHT_COLOR = Color(0xff333333);
  static const Color THIRD_LIGHT_COLOR = Color(0xffF1EAFF);
  static const Color LIGHT_ACCENT_COLOR = Color(0XFF7071E8);
}
