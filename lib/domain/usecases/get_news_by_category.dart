// ignore_for_file: depend_on_referenced_packages

import 'package:news_zone/domain/enteties/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:news_zone/domain/enteties/new_params.dart';
import 'package:news_zone/domain/enteties/news_entity.dart';
import 'package:news_zone/domain/repositories/news_repository.dart';
import 'package:news_zone/domain/usecases/usecase.dart';

class GetNewsbyCategory extends Usecase<List<NewsEntity>, NewsParm> {
  final NewsRepository newsRepository;

  GetNewsbyCategory({required this.newsRepository});
  @override
  Future<Either<AppError, List<NewsEntity>>> call(NewsParm parms) async {
    return await newsRepository.getNewsbyCategory(parms.parmString);
  }
}
