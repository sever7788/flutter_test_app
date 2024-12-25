import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/constants.dart';
import 'package:flutter_test_app/core/constants/colors.dart';

final lightTheme = ThemeData(
  navigationBarTheme: const NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white, 
    ),
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontFamily: "Montserrat",
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: CustomColors.lightPrimaryColor,
    ),
  ),
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CustomColors.lightAccentColor,
      onPrimary: CustomColors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFF4F4F4F)),
);
