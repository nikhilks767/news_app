// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;
  var baseUrl = "https://newsapi.org";

  fetchData() async {
    isLoading = true;
    final url =
        "$baseUrl/v2/top-headlines?country=in&apiKey=147d823382054dcfad453253ba1ffcc0";
    final response = await http.get(Uri.parse(url));
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

//for launching url
  Future<void> launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1, mode: LaunchMode.inAppWebView)) {
        await launchUrl(url1, mode: LaunchMode.inAppWebView);
      } else {
        throw "Could not launch $url";
      }
    } catch (e) {
      print("Error : $e");
    }
    notifyListeners();
  }

//for sharing
  void shareText({String text = ""}) {
    try {
      Share.share(text);
    } catch (e) {
      print("Error : $e");
    }
    notifyListeners();
  }
}
