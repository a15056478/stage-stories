import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stage_stories/core/params/no_params.dart';
import 'package:stage_stories/core/use%20case/get_stories.dart';
import 'package:stage_stories/core/model/story/user_stories.dart';

part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  final GetStories getStories;
  StoriesBloc({required this.getStories}) : super(StoriesInitial(stories: [])) {
    on<StoriesEventLoadData>((event, emit) async {
      final data = await getStories.call(NoParams());

      data.fold((l) => 'Handle error here',
          (r) => emit(StoriesStateUpdated(stories: r)));
    });
  }
}
