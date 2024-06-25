// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:http/http.dart' as http;

class CategoryScreenController with ChangeNotifier {
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  List<String> imageList = [
    "assets/images/business.jpg",
    "assets/images/entertain.jpg",
    "assets/images/general.jpg",
    "assets/images/health.jpg",
    "assets/images/science.jpg",
    "assets/images/sports.jpg",
    "assets/images/tech.jpg",
  ];
  String initial = "business";
  onTap({required int index}) {
    initial = categoryList[index].toLowerCase();
    getNewsCategory();
    print(initial);
    notifyListeners();
  }

  late NewsModel newsModel;
  bool isLoading = false;

  getNewsCategory() async {
    isLoading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$initial&apiKey=147d823382054dcfad453253ba1ffcc0");
    print(initial);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api Failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
