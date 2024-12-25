
import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/colors.dart';

final primarySwatchColor = Color(0xFF979797);

final lightTheme = ThemeData(
  navigationBarTheme: NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
  // iconTheme: IconThemeData(
  //   color: Colors.white,
  // ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white, // установка цвета для иконок AppBar - чёрный
    ),
    elevation: 0,
    centerTitle: true,
    // backgroundColor: const Color.fromARGB(255, 27, 27, 27),
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontFamily: "Montserrat",
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: CustomColors.lightPrimaryColor,
    ),
  ),
  colorScheme:const ColorScheme(
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