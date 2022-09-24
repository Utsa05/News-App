import 'package:dartz/dartz.dart';
import 'package:news_zone/domain/enteties/app_error.dart';

abstract class Usecase<Type, Parms> {
  Future<Either<AppError, Type>> call(Parms parms);
}
