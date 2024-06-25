import 'package:flutter/material.dart';
import 'package:news_app/controller/bottom_nav_controller.dart';
import 'package:news_app/controller/category_screen_controller.dart';
import 'package:news_app/controller/home_screen_controller.dart';
import 'package:news_app/controller/search_screen_controller.dart';
import 'package:news_app/controller/splash_screen_controller.dart';
import 'package:news_app/view/bottom_navigation/main_page.dart';
import 'package:news_app/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<SplashScreenProvider>(
          builder: (context, splashScreenProvider, _) {
            return splashScreenProvider.isLoading
                ? SplashScreen()
                : MainPage(
                    index: Provider.of<BottomNavController>(context)
                        .selectedIndex);
          },
        ),
      ),
    );
  }
}
