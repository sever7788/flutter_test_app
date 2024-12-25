import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/colors.dart';
import 'package:flutter_test_app/core/constants/fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      
          alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: CustomColors.lightAccentColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          shape: BoxShape.rectangle
        ),
        child: Text(
          text,
          style: TextStyles.title2.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
