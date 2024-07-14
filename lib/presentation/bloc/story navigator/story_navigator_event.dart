part of 'story_navigator_bloc.dart';

sealed class StoryNavigatorEvent extends Equatable {
  final int currentIndexIndex;
  const StoryNavigatorEvent({required this.currentIndexIndex});
}

class StoryNavigatorEventMoveNext extends StoryNavigatorEvent {
  StoryNavigatorEventMoveNext({required super.currentIndexIndex});

  @override
  List<Object?> get props => [currentIndexIndex];
}

class StoryNavigatorEventLastPage extends StoryNavigatorEvent {
  StoryNavigatorEventLastPage({required super.currentIndexIndex});

  @override
  List<Object?> get props => [currentIndexIndex];
}
