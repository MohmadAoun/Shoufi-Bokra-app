import 'package:flutter/material.dart';
import 'package:shoufibokra/consts/app_style.dart';

ThemeData lightTheme = ThemeData(
  buttonTheme: const ButtonThemeData(buttonColor: AppColors.LIGHT_ACCENT_COLOR),
  appBarTheme: const AppBarTheme(color: AppColors.LIGHT_ACCENT_COLOR),
  brightness: Brightness.light,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          color: AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: 'Clash Grotesk',
        ),
      ),
      backgroundColor:
          const MaterialStatePropertyAll(AppColors.LIGHT_ACCENT_COLOR),
      iconColor: MaterialStatePropertyAll(
        AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          color: AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: 'Clash Grotesk',
        ),
      ),
      backgroundColor:
          const MaterialStatePropertyAll(AppColors.LIGHT_ACCENT_COLOR),
      iconColor: MaterialStatePropertyAll(
        AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
      ),
    ),
  ),
  primaryColor: AppColors.PRIMARY_LIGHT_COLOR,
  scaffoldBackgroundColor: AppColors.PRIMARY_LIGHT_COLOR,
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.LIGHT_ACCENT_COLOR,
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.all(0),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(200),
    ),
    errorStyle: const TextStyle(
      fontSize: 10,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(200),
    ),
    filled: true,
    fillColor: AppColors.LIGHT_ACCENT_COLOR,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF4F1A11)),
      borderRadius: BorderRadius.circular(200),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF4F1A11)),
      borderRadius: BorderRadius.circular(200),
    ),
    iconColor: AppColors.SECONDARY_LIGHT_COLOR,
    prefixIconColor: AppColors.SECONDARY_LIGHT_COLOR,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        color: AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600,
        fontFamily: 'Manrope'),
    bodyMedium: TextStyle(
        color: AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: 'Manrope'),
    bodySmall: TextStyle(
        color: AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w200,
        fontFamily: 'Manrope'),
    displayLarge: TextStyle(
        color: AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w800,
        fontFamily: 'Clash Grotesk'),
    displayMedium: TextStyle(
        color: AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Clash Grotesk'),
    displaySmall: TextStyle(
        color: AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: 'Clash Grotesk'),
  ),
  iconTheme: IconThemeData(
    color: AppColors.SECONDARY_LIGHT_COLOR.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white,
  ),
);
ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(color: AppColors.DARK_ACCENT_COLOR),
  brightness: Brightness.dark,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: 'Clash Grotesk',
        ),
      ),
      backgroundColor:
          const MaterialStatePropertyAll(AppColors.DARK_ACCENT_COLOR),
      iconColor: const MaterialStatePropertyAll(AppColors.SECONDARY_DARK_COLOR),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: 'Clash Grotesk',
        ),
      ),
      backgroundColor:
          const MaterialStatePropertyAll(AppColors.DARK_ACCENT_COLOR),
      iconColor: MaterialStatePropertyAll(
        AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
      ),
    ),
  ),
  primaryColor: AppColors.PRIMARY_DARK_COLOR,
  scaffoldBackgroundColor: AppColors.PRIMARY_DARK_COLOR,
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.DARK_ACCENT_COLOR,
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.all(0),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    ),
    errorStyle: const TextStyle(
      fontSize: 10,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: AppColors.DARK_ACCENT_COLOR,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF4F1A11)),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF4F1A11)),
      borderRadius: BorderRadius.circular(10),
    ),
    iconColor: AppColors.SECONDARY_DARK_COLOR,
    prefixIconColor: AppColors.SECONDARY_DARK_COLOR,
  ),
  textTheme: TextTheme(
    headlineSmall: TextStyle(
        color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w200,
        fontFamily: 'Manrope'),
    bodyLarge: TextStyle(
        color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600,
        fontFamily: 'Manrope'),
    bodyMedium: TextStyle(
        color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: 'Manrope'),
    bodySmall: TextStyle(
        color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w200,
        fontFamily: 'Manrope'),
    displayLarge: TextStyle(
        color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w800,
        fontFamily: 'Clash Grotesk'),
    displayMedium: TextStyle(
        color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Clash Grotesk'),
    displaySmall: TextStyle(
        color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: 'Clash Grotesk'),
  ),
  iconTheme: IconThemeData(
    color: AppColors.PRIMARY_DARK_COLOR.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white,
  ),
);
