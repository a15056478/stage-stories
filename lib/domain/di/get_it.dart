import 'package:get_it/get_it.dart';
import 'package:stage_stories/presentation/bloc/stories/stories_bloc.dart';
import 'package:stage_stories/presentation/bloc/story%20navigator/story_navigator_bloc.dart';
import 'package:stage_stories/domain/firebase_config.dart';
import 'package:stage_stories/core/repository/storiy_repository.dart';
import 'package:stage_stories/core/repository/story_repository_impl.dart';
import 'package:stage_stories/core/use%20case/get_stories.dart';

final getItInstance = GetIt.I;

Future<void> init() async {
  getItInstance.registerLazySingleton<FierbaseConfig>(() => FierbaseConfig());

  getItInstance.registerLazySingleton<StoryRepository>(
      () => StoryRepositoryImpl(fierbaseConfig: getItInstance()));

  getItInstance.registerLazySingleton<GetStories>(
      () => GetStories(repository: getItInstance()));

  getItInstance.registerLazySingleton<StoriesBloc>(
      () => StoriesBloc(getStories: getItInstance()));

  getItInstance
      .registerLazySingleton<StoryNavigatorBloc>(() => StoryNavigatorBloc());
}
