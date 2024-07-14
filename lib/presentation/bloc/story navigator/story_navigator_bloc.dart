import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'story_navigator_event.dart';
part 'story_navigator_state.dart';

class StoryNavigatorBloc
    extends Bloc<StoryNavigatorEvent, StoryNavigatorState> {
  StoryNavigatorBloc() : super(const StoryNavigatorInitial(currentIndex: 0)) {
    on<StoryNavigatorEventMoveNext>((event, emit) {
      emit(StoryNavigatorIndexUpdating(currentIndex: state.currentIndex));
      emit(StoryNavigatorIndexUpdated(currentIndex: event.currentIndexIndex));
    });
    on<StoryNavigatorEventLastPage>((event, emit) {
      emit(StoryNavigatorIndexUpdating(currentIndex: state.currentIndex));
      emit(StoryNavigatorLastPage(currentIndex: event.currentIndexIndex));
    });
  }
}
