// ignore_for_file: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:news_zone/data/core/api_client.dart';
import 'package:news_zone/data/datasources/news_remote_datasource.dart';
import 'package:news_zone/data/repositories/news_repository_imp.dart';
import 'package:news_zone/domain/repositories/news_repository.dart';
import 'package:news_zone/domain/usecases/get_news_by_category.dart';
import 'package:news_zone/domain/usecases/get_news_by_country.dart';
import 'package:news_zone/domain/usecases/get_news_usecase.dart';
import 'package:news_zone/presentation/cubits/loading_cubit/loading_cubit.dart';
import 'package:news_zone/presentation/cubits/news_cubit/news_cubit.dart';

final getInstance = GetIt.I;

Future init() async {
  //internal
  getInstance.registerLazySingleton<Client>(() => Client());
  getInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(client: getInstance()));
  getInstance.registerLazySingleton<NewsRemoteDatasource>(
      () => NewsRemoteDatasourceImpl(apiClient: getInstance()));
  getInstance.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(newsRemoteDatasource: getInstance()));

  //uscases
  getInstance.registerLazySingleton<GetNewsUsecase>(
      () => GetNewsUsecase(newsRepository: getInstance()));
  getInstance.registerLazySingleton<GetNewsbyCountry>(
      () => GetNewsbyCountry(newsRepository: getInstance()));
  getInstance.registerLazySingleton<GetNewsbyCategory>(
      () => GetNewsbyCategory(newsRepository: getInstance()));

  //ui
  getInstance.registerSingleton<LoadingCubit>(LoadingCubit());
  getInstance.registerFactory(() => NewsCubit(getInstance(), getInstance(),getInstance()));
}
