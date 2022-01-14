import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ganto_pawon/view/Food/cart.dart';
import 'package:ganto_pawon/view/userIn/signOut.dart';
import 'MainHomeScreen.dart';
class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int selectedIndex = 0;

  List _screenAppear =[
    
    MainScreen(),
    Cart(),
    SignOut()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child:_screenAppear.elementAt(selectedIndex)
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.shopping_cart,
            label: 'Cart',
            selectedBackgroundColor: Colors.orange,
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Profile',
            selectedBackgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}