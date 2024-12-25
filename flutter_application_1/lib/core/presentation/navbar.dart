import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/presentation/bottombar.dart';
import 'package:flutter_test_app/core/constants/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  final Function(int) onItemTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      child: NavigationBar(
        onDestinationSelected: onItemTapped,
        selectedIndex: selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        shadowColor: Colors.black,
        destinations: <Widget>[
          NavigationDestination(
            icon: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 50),
              child: const Icon(Icons.home),
            ),
            label: screenNames[Screens.home]!,
          ),
          NavigationDestination(
            icon: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 50),
              child: const Badge(
                child: Icon(Icons.shopping_cart),
              ),
            ),
            label: screenNames[Screens.cart]!,
          ),
        ],
      ),
    );
  }
}
