import 'package:stage_stories/core/model/error/api_response_error.dart';
import 'package:stage_stories/core/model/story/user_stories.dart';
import 'package:dartz/dartz.dart';

abstract class StoryRepository {
  Future<Either<ApiReponseError, List<UserStories>>> getUserStories();
}
