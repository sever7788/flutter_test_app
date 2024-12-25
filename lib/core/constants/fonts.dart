import 'package:flutter/material.dart';

class Fonts {
  static TextStyle regular =
      const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w400);
  static TextStyle medium =
      const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500);
  static TextStyle semiBold =
      const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600);
}

class TextStyles {
  static TextStyle subtitle1 = Fonts.medium.copyWith(fontSize: 22, height: 1);
  static TextStyle subtitle2 = Fonts.medium.copyWith(fontSize: 18, height: 1);
  static TextStyle title1 = Fonts.medium.copyWith(fontSize: 25, height: 1);
  static TextStyle title2 = Fonts.medium.copyWith(fontSize: 20, height: 1);
}
