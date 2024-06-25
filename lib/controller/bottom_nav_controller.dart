import 'package:flutter/material.dart';
import 'package:news_app/view/category_screen/category_screen.dart';
import 'package:news_app/view/home_screen/home_screen.dart';
import 'package:news_app/view/search_screen/search_screen.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;
  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List screens = [
    HomeScreen(),
    CategorySCreen(),
    SearchScreen(),
  ];
}
