// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:news_zone/domain/enteties/app_error.dart';
import 'package:news_zone/domain/enteties/news_entity.dart';

abstract class NewsRepository {
  Future<Either<AppError, List<NewsEntity>>> getNews();
  Future<Either<AppError, List<NewsEntity>>> getNewsbyCountry(String country);
  Future<Either<AppError, List<NewsEntity>>> getNewsbyCategory(String category);
}
