part of 'news_cubit.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsError extends NewsState {
  final AppErrorType errorType;

  NewsError(this.errorType);
}

class NewsLoaded extends NewsState {
  final List<NewsEntity> news;

  NewsLoaded({required this.news});
}

class NewsbyCategoryLoaded extends NewsState {
  final List<NewsEntity> news;
  

  NewsbyCategoryLoaded({required this.news});
}
