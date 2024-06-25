// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controller/bottom_nav_controller.dart';
import 'package:news_app/controller/home_screen_controller.dart';
import 'package:news_app/utils/text_style.dart';
import 'package:news_app/view/bottom_navigation/main_page.dart';
import 'package:news_app/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    BottomNavController providerB = Provider.of<BottomNavController>(context);
    fetchData(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Text("News Today  🗞️", style: TextStyle(color: Colors.white)),
        titleTextStyle: NewsText.textMain,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MainPage(index: providerB.selectedIndex = 2)));
              },
              icon: Icon(Icons.search, color: Colors.white)),
          SizedBox(width: 15)
        ],
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, provider, child) {
          return provider.isLoading == true
              ? Center(
                  child: LottieBuilder.asset(
                    "assets/animations/Animation - 2.json",
                    fit: BoxFit.cover,
                    height: 130,
                    width: 130,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.separated(
                    itemCount: provider.newsModel.articles?.length ?? 0,
                    itemBuilder: (context, index) => NewsCard(
                      imageUrl: provider.newsModel.articles?[index].urlToImage
                              .toString() ??
                          "",
                      title: provider.newsModel.articles?[index].title
                              .toString() ??
                          "",
                      description: provider
                              .newsModel.articles?[index].description
                              .toString() ??
                          "",
                      sourceName: provider
                              .newsModel.articles?[index].source?.name
                              .toString() ??
                          "",
                      date: provider.newsModel.articles?[index].publishedAt,
                      url: provider.newsModel.articles?[index].url.toString() ??
                          "",
                      contant: provider.newsModel.articles?[index].content
                              .toString() ??
                          "",
                      author: provider.newsModel.articles?[index].author
                              .toString() ??
                          "",
                    ),
                    separatorBuilder: (context, index) => Divider(thickness: 1),
                  ),
                );
        },
      ),
    );
  }
}
