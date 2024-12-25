import 'package:flutter/material.dart';

import 'package:flutter_test_app/core/presentation/navbar.dart';
import 'package:flutter_test_app/core/constants/constants.dart';
import 'package:flutter_test_app/features/cart/presentation/cart_screen.dart';
import 'package:flutter_test_app/features/home/presentation/home_screen.dart';


//Widget displaying main pages with navbar
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  
  final List<Widget> pages = [const HomeScreen(), const CartScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          style: TextStyles.title1.copyWith(color: CustomColors.dark),
          screenNames.values.elementAt(_selectedIndex),),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar:
          NavBar(onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}
