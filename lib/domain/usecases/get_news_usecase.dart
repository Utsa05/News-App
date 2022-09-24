// ignore_for_file: avoid_renaming_method_parameters, depend_on_referenced_packages

import 'package:news_zone/domain/enteties/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:news_zone/domain/enteties/news_entity.dart';
import 'package:news_zone/domain/enteties/no_parms.dart';
import 'package:news_zone/domain/repositories/news_repository.dart';
import 'package:news_zone/domain/usecases/usecase.dart';

class GetNewsUsecase extends Usecase<List<NewsEntity>, NoParms> {
  final NewsRepository newsRepository;

  GetNewsUsecase({required this.newsRepository});
  @override
  Future<Either<AppError, List<NewsEntity>>> call(NoParms noParms) async {
    return newsRepository.getNews();
  }
}
