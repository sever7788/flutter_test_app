import 'package:flutter/material.dart';

import 'package:flutter_test_app/core/constants/colors.dart';


//Bottom panel for displaying the navigation bar or other elements
//Accepts a child element
class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.07,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors.darkAccentColor,
              spreadRadius: 1,
              blurRadius: 30,
            )
          ]
        ),
          child: child,
      ),
    );
  }
}