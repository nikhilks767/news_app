// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/controller/home_screen_controller.dart';
import 'package:news_app/utils/text_style.dart';
import 'package:news_app/view/widgets/news_detail.dart';
import 'package:provider/provider.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String sourceName;
  final DateTime? date;
  final String url;
  final String contant;
  final String author;
  const NewsCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.sourceName,
      required this.date,
      required this.url,
      required this.contant,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetailScreen(
                          imageUrl: imageUrl,
                          title: title,
                          sourceName: sourceName,
                          author: author,
                          description: description,
                          contant: contant,
                          date: date,
                          url: url,
                        )));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: NewsText.textNews),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          overflow: TextOverflow.fade,
                          "$sourceName | ${DateFormat("dd/mm/yyyy").format(date!).toString()}",
                          style: NewsText.sourceDateText),
                      IconButton(
                          onPressed: () {
                            String sharedNews =
                                "$title \n \n $description \n \n $url";
                            Provider.of<HomeScreenController>(context,
                                    listen: false)
                                .shareText(text: sharedNews);
                          },
                          icon: Icon(Icons.share, size: 20))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
