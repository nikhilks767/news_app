import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controller/category_screen_controller.dart';
import 'package:news_app/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({super.key});

  void getNews(BuildContext context) {
    Provider.of<CategoryScreenController>(context, listen: false)
        .getNewsCategory();
  }

  @override
  Widget build(BuildContext context) {
    getNews(context);
    return Consumer<CategoryScreenController>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
        ),
        body: provider.isLoading == true
            ? Center(
                child: LottieBuilder.asset(
                  "assets/animations/Animation - 2.json",
                  fit: BoxFit.cover,
                  height: 130,
                  width: 130,
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.all(20),
                itemCount: provider.newsModel.articles?.length ?? 0,
                itemBuilder: (context, index) => NewsCard(
                  author:
                      provider.newsModel.articles?[index].author.toString() ??
                          "",
                  contant:
                      provider.newsModel.articles?[index].content.toString() ??
                          "",
                  date: provider.newsModel.articles?[index].publishedAt,
                  description: provider.newsModel.articles?[index].description
                          .toString() ??
                      "",
                  imageUrl: provider.newsModel.articles?[index].urlToImage
                          .toString() ??
                      "",
                  sourceName: provider.newsModel.articles?[index].source?.name
                          .toString() ??
                      "",
                  title: provider.newsModel.articles?[index].title.toString() ??
                      "",
                  url: provider.newsModel.articles?[index].url.toString() ?? "",
                ),
                separatorBuilder: (context, index) => Divider(thickness: 1),
              ),
      ),
    );
  }
}
