// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controller/search_screen_controller.dart';
import 'package:news_app/utils/text_style.dart';
import 'package:news_app/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textcontroller = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        toolbarHeight: 70,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextFormField(
                  controller: textcontroller,
                  cursorColor: Colors.purple,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Type here",
                    hoverColor: Colors.transparent,
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStatePropertyAll(3),
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          surfaceTintColor:
                              MaterialStatePropertyAll(Colors.purpleAccent)),
                      onPressed: () {
                        provider.searchNews(
                          searchText: textcontroller.text.toLowerCase(),
                        );
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Text(
                        "Search",
                        style: NewsText.searchText,
                      )))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: provider.isLoading == true
                  ? Center(
                      child: LottieBuilder.asset(
                        "assets/animations/Animation - 2.json",
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.separated(
                          itemBuilder: (context, index) => NewsCard(
                              imageUrl: provider
                                      .newsModel?.articles?[index].urlToImage
                                      .toString() ??
                                  "",
                              title: provider.newsModel?.articles?[index].title
                                      .toString() ??
                                  "",
                              description: provider
                                      .newsModel?.articles?[index].description
                                      .toString() ??
                                  "",
                              sourceName:
                                  provider.newsModel?.articles?[index].source?.name.toString() ?? "",
                              date: provider.newsModel?.articles?[index].publishedAt,
                              url: provider.newsModel?.articles?[index].url.toString() ?? "",
                              contant: provider.newsModel?.articles?[index].content.toString() ?? "",
                              author: provider.newsModel?.articles?[index].author.toString() ?? ""),
                          separatorBuilder: (context, index) => Divider(thickness: 1),
                          itemCount: provider.newsModel?.articles?.length ?? 0),
                    )),
        ],
      ),
    );
  }
}
