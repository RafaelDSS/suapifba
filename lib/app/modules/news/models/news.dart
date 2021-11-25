// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(List items) =>
    List<NewsModel>.from(items.map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    required this.link,
    required this.title,
  });

  String link;
  String title;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        link: json["link"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "title": title,
      };
}
