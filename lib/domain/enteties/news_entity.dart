// ignore_for_file: depend_on_referenced_packages

import 'package:news_zone/data/models/news_model.dart';
import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final NewsSource? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  const NewsEntity(this.source, this.author, this.title, this.description,
      this.url, this.urlToImage, this.publishedAt, this.content);

  @override
  List<Object?> get props => [source, title];
  @override
  bool get stringify => true;
}
