// To parse this JSON data, do
//
//     final newResultModel = newResultModelFromJson(jsonString);

import 'dart:convert';

import 'package:news_zone/data/models/news_model.dart';

NewResultModel newResultModelFromJson(String str) =>
    NewResultModel.fromJson(json.decode(str));

String newResultModelToJson(NewResultModel data) => json.encode(data.toJson());

class NewResultModel {
  NewResultModel({
    this.status,
    this.totalResults,
    this.news,
  });

  String? status;
  int? totalResults;
  List<NewsModel>? news;

  factory NewResultModel.fromJson(Map<String, dynamic> json) => NewResultModel(
        status: json["status"],
        totalResults: json["totalResults"],
        news: List<NewsModel>.from(
            json["articles"].map((x) => NewsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(news!.map((x) => x.toJson())),
      };
}
