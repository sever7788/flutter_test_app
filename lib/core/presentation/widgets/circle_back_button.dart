import 'package:flutter/material.dart';

import 'package:flutter_test_app/core/constants/constants.dart';

//Button to go to previous page
class CircleBackButton extends StatelessWidget {
  const CircleBackButton({super.key, required this.onTap});

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => {},
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 45,
        height: 45,
        decoration: const BoxDecoration(
            color: CustomColors.lightAccentColor, shape: BoxShape.circle),
        child: const Icon(Icons.arrow_back, color: Colors.white,),
      ),
    );
  }
}
