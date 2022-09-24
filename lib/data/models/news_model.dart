// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:news_zone/domain/enteties/news_entity.dart';
import 'package:equatable/equatable.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  }) : super(source, author, title, description, url, urlToImage, publishedAt,
            content);

  NewsSource? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: NewsSource.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content,
      };
}

class NewsSource extends Equatable {
  NewsSource({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory NewsSource.fromJson(Map<String, dynamic> json) => NewsSource(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object?> get props => [name];
}
