import 'package:dartz/dartz.dart';
import 'package:stage_stories/core/model/error/api_response_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ApiReponseError, Type>> call(Params params);
}
