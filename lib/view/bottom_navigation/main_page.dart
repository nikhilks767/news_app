// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/controller/bottom_nav_controller.dart';
import 'package:news_app/utils/text_style.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  final int index;
  const MainPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .screens[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.purple),
          child: BottomNavigationBar(
              currentIndex:
                  Provider.of<BottomNavController>(context).selectedIndex,
              onTap: Provider.of<BottomNavController>(context, listen: false)
                  .onItemTap,
              elevation: 0,
              backgroundColor: Colors.purple,
              selectedIconTheme:
                  IconThemeData(color: Colors.white, size: 25, opacity: 1),
              unselectedIconTheme:
                  IconThemeData(size: 25, opacity: 0.4, color: Colors.black),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedLabelStyle: NewsText.searchText,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: "Category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
              ]),
        ),
      ),
    );
  }
}
