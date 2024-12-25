import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/presentation/bottombar.dart';
import 'package:flutter_test_app/core/constants/constants.dart';
import 'package:flutter_test_app/features/cart/presentation/bloc/purchases_map_bloc.dart';

//Navigation bar
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
          //navbar element
          NavigationDestination(
            icon: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 50),
              child: const Icon(Icons.home),
            ),
            label: screenNames[Screens.home]!,
          ),
          //navbar element with red label
          NavigationDestination(
            icon: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 50),
              child: BlocBuilder<PurchasesMapBloc, PurchasesMapState>(
                builder: (context, state) {
                  int counter = state.purchasesMap.entries.length;
                  return Badge(
                    isLabelVisible: counter != 0,
                    label: Text(state.purchasesMap.entries.length.toString()),
                    child: const Icon(Icons.shopping_cart),
                  );
                },
              ),
            ),
            label: screenNames[Screens.cart]!,
          ),
        ],
      ),
    );
  }
}
