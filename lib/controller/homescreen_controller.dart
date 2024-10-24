import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_new/model/homescreen_model.dart';

class HomescreenController with ChangeNotifier {
  NewsModel? newmodel;
  bool isloading = false;
  List<Article> newsarticle = [];

  Future<void> getdata() async {
    isloading = true;
    notifyListeners();

    Uri news = Uri.parse(
        "https://newsapi.org/v2/everything?q=keyword&apiKey=8dd5d4482b1644e1816b5b2c09706214");

    try {
      var response = await http.get(news);
      if (response.statusCode == 200) {
        newmodel = NewsModel.fromJson(jsonDecode(response.body));
        newsarticle = newmodel?.articles ?? [];
        log(newsarticle.isNotEmpty
            ? newsarticle[0].title.toString()
            : 'No articles found');
      } else {
        log('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }

    isloading = false;
    notifyListeners();
  }
}
