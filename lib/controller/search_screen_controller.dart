// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:http/http.dart' as http;

class SearchScreenController with ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;
  Future<void> searchNews({required String searchText}) async {
    isLoading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&sortBy=publishedAt&apiKey=147d823382054dcfad453253ba1ffcc0");
    try {
      final response = await http.get(
        url,
        // headers: {
        //   'Content-Type': 'application/json',
        // }
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      } else {
        print("Api Failed");
      }
    } catch (e) {
      print("Error Fetching : $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
