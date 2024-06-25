// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/utils/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String sourceName;
  final DateTime? date;
  final String url;
  final String contant;
  final String author;
  const NewsDetailScreen(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.sourceName,
      this.date,
      required this.url,
      required this.contant,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: NewsText.newsDetailText),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
              SizedBox(height: 8),
              Text(
                  "$sourceName | ${DateFormat("dd/mm/yyyy").format(date!).toString()}"),
              SizedBox(height: 10),
              Text(author),
              SizedBox(height: 8),
              Text(description),
              SizedBox(height: 8),
              Text(contant),
              SizedBox(height: 8),
              InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    launchUrl(Uri.parse(url)).toString();
                  },
                  child: Text(
                    "Read More...",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
