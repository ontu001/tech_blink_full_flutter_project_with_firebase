import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tech_blink/const/app_colors.dart';
import 'package:tech_blink/ui/views/nav_pages/favourite.dart';
import 'package:tech_blink/ui/views/nav_pages/home.dart';
import 'package:tech_blink/ui/views/nav_pages/profile.dart';

import 'nav_pages/cart.dart';

class BottomNavController extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  final _pages = [
    Home(),
    Favourite(),
    Cart(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: SalomonBottomBar(
            selectedItemColor: AppColors.mandarinColor,
            currentIndex: _currentIndex.value,
            onTap: (val) {
              _currentIndex.value = val;
            },
            items: [
              bottomBarItem(Icons.home_filled, 'Home'),
              bottomBarItem(Icons.favorite_outline, 'Favourite'),
              bottomBarItem(Icons.shopping_bag_outlined, 'Cart'),
              bottomBarItem(Icons.person_2_outlined, 'Profile'),
            ],
          ),
          body: _pages[_currentIndex.value],
        ));
  }
}

SalomonBottomBarItem bottomBarItem(icon, title) =>
    SalomonBottomBarItem(icon: Icon(icon), title: Text(title));
