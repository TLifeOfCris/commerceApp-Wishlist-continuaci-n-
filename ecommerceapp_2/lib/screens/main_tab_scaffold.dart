import 'package:ecommerceapp_2/screens/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTabScaffold extends StatelessWidget {
  const MainTabScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(tabBar: CupertinoTabBar(items: const [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.house), label:  'Home'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart),
        label: 'Wishlist')
    ]), tabBuilder: (context, index){
      switch (index){
        case 0:
      return const Homescreen();
        case 1:
        return Placeholder();
        default: 
        return SizedBox();
      }
    });
  }
}