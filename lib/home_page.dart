import 'package:flutter/material.dart';
import 'package:my_furniture_app/cart/cart_screen.dart';

import 'package:my_furniture_app/profile_page.dart';
import 'package:my_furniture_app/search_page.dart';
import 'home_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  final screens = [
     HomeScreen(),
    SearchPage(),
    CartScreen(),
    const ProfilePage(),
    // const ProductDetailsScreen(),
  ];

  late int _currentTab;

  @override
  void initState() {
    super.initState();
    _currentTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[_currentTab]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentTab,
        onTap: (index) => setState(() => _currentTab = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }
}
