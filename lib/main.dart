// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:news_zone/domain/enteties/app_error.dart';
import 'package:news_zone/domain/enteties/new_params.dart';
import 'package:news_zone/domain/enteties/news_entity.dart';

import 'package:news_zone/domain/usecases/get_news_by_category.dart';

import 'package:news_zone/presentation/news_app.dart';
import 'package:dartz/dartz.dart';
import 'di/get_it.dart' as getit;

void main() async {
  unawaited(getit.init());
  WidgetsFlutterBinding.ensureInitialized();

  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);

  // ApiClient client = ApiClient(client: Client());
  // NewsRemoteDatasource datasource = NewsRemoteDatasourceImpl(apiClient: client);
  // NewsRepository newsRepository =
  //     NewsRepositoryImpl(newsRemoteDatasource: datasource);
  // newsRepository.getNewsbyCategory('business');

  // final Either<AppError, List<NewsEntity>> eitherResponse =
  //     await newsRepository.getNewsbyCountry("in");
  // eitherResponse.fold((l) {
  //   print(l);
  // }, (news) {
  //   print(news);
  // });

  // GetNewsbyCategory getNewsUsecase = getit.getInstance<GetNewsbyCategory>();

  // final Either<AppError, List<NewsEntity>> eitherResponse =
  //     await getNewsUsecase(const NewsParm('Apple'));
  // eitherResponse.fold((l) {
  //   print(l);
  // }, (news) {
  //   print(news);
  // });

  runApp(const NewsApp());
}
