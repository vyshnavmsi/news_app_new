// To parse this JSON data, do
//
//     final newsmodel = newsmodelFromJson(jsonString);

import 'dart:convert';


NewsModel productmodelFromJson(String str) =>
    NewsModel.fromJson(json.decode(str));

class NewsModel {
  List<Article>? articles;

  NewsModel({this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      articles: (json['articles'] as List)
          .map((article) => Article.fromJson(article))
          .toList(),
    );
  }
}

class Article {
  String? title;
  String? author;
  String? content;
  String? description;

  Article({this.title, this.author, this.content, this.description});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      author: json['author'],
      content: json['content'],
      description: json['description'],
    );
  }

  get urlToImage => null;
}
