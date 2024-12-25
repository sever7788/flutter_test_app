import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/colors.dart';

class CircleBackButton extends StatelessWidget {
  const CircleBackButton({super.key, required this.onTap});

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
          color: CustomColors.lightAccentColor, shape: BoxShape.circle),
      child: Expanded(
        child: GestureDetector(
          onDoubleTap: () => {},
          onTap: onTap,
          behavior: HitTestBehavior.translucent,
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
