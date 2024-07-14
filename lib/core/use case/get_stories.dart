import 'package:dartz/dartz.dart';
import 'package:stage_stories/core/params/no_params.dart';
import 'package:stage_stories/core/repository/storiy_repository.dart';
import 'package:stage_stories/core/use%20case/use_case.dart';
import 'package:stage_stories/core/model/error/api_response_error.dart';
import 'package:stage_stories/core/model/story/user_stories.dart';

class GetStories extends UseCase<List<UserStories>, NoParams> {
  final StoryRepository repository;

  GetStories({required this.repository});

  @override
  Future<Either<ApiReponseError, List<UserStories>>> call(
      NoParams params) async {
    return await repository.getUserStories();
  }
}
