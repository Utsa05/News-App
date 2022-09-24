// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news_zone/data/datasources/news_remote_datasource.dart';
import 'package:news_zone/domain/enteties/news_entity.dart';
import 'package:news_zone/domain/enteties/app_error.dart';
import 'package:news_zone/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDatasource newsRemoteDatasource;

  NewsRepositoryImpl({required this.newsRemoteDatasource});
  @override
  Future<Either<AppError, List<NewsEntity>>> getNews() async {
    try {
      final news = await newsRemoteDatasource.getNews();
      return Right(news);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<NewsEntity>>> getNewsbyCategory(
      String category) async {
    try {
      final news = await newsRemoteDatasource.getNewsbyCategory(category);
      return Right(news);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<NewsEntity>>> getNewsbyCountry(
      String country) async {
    try {
      final news = await newsRemoteDatasource.getNewsbyCountry(country);
      return Right(news);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.database));
    }
  }
}
