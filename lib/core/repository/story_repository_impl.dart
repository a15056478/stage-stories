import 'package:dartz/dartz.dart';
import 'package:stage_stories/domain/firebase_config.dart';
import 'package:stage_stories/core/repository/storiy_repository.dart';
import 'package:stage_stories/core/model/error/api_response_error.dart';
import 'package:stage_stories/core/model/story/user_stories.dart';

class StoryRepositoryImpl extends StoryRepository {
  final FierbaseConfig fierbaseConfig;

  StoryRepositoryImpl({required this.fierbaseConfig});

  @override
  Future<Either<ApiReponseError, List<UserStories>>> getUserStories() async {
    final data = fierbaseConfig.getUserStories();
    return data;
  }
}
