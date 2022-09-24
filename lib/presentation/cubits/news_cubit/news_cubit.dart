// ignore_for_file: depend_on_referenced_packages, unused_import

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_zone/domain/enteties/app_error.dart';
import 'package:news_zone/domain/enteties/new_params.dart';
import 'package:news_zone/domain/enteties/news_entity.dart';
import 'package:news_zone/domain/enteties/no_parms.dart';
import 'package:news_zone/domain/usecases/get_news_by_category.dart';
import 'package:news_zone/domain/usecases/get_news_usecase.dart';
import 'package:news_zone/presentation/cubits/loading_cubit/loading_cubit.dart';
import 'package:dartz/dartz.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.loadingCubit, this.getNewsUsecase, this.getNewsbyCategory)
      : super(NewsInitial());
  final LoadingCubit loadingCubit;
  final GetNewsUsecase getNewsUsecase;
  final GetNewsbyCategory getNewsbyCategory;

  void loadNews() async {
    loadingCubit.show();
    final moviesEither = await getNewsUsecase.call(NoParms());

    emit(moviesEither.fold((error) => NewsError(error.appErrorType), (news) {
      print('hi rom news');
      return NewsLoaded(news: news);
    }));
    print('Loaded News');
    loadingCubit.hide();
  }

  void loadbycategoryNews(String categoryName) async {
    loadingCubit.show();
    final moviesEither = await getNewsbyCategory.call(NewsParm(categoryName));

    emit(moviesEither.fold((error) => NewsError(error.appErrorType), (news) {
      print("Hi from Category");
      
      return NewsbyCategoryLoaded(news: news);
    }));

    print('Loaded News Category');
    loadingCubit.hide();
  }
}
