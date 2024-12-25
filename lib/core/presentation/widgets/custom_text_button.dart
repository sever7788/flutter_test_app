import 'package:flutter/material.dart';

import 'package:flutter_test_app/core/constants/constants.dart';


//Button with text
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.enabled = true,
    required this.text,
    required this.onTap,
  });

  final bool enabled; //Allows click processing
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        alignment: Alignment.center,
        decoration:  BoxDecoration(
            color: enabled ? CustomColors.lightAccentColor : CustomColors.darkSecondColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            shape: BoxShape.rectangle),
        child: Text(
          text,
          style: TextStyles.title2.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
