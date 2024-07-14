part of 'story_navigator_bloc.dart';

sealed class StoryNavigatorState extends Equatable {
  final int currentIndex;
  const StoryNavigatorState({required this.currentIndex});
}

final class StoryNavigatorInitial extends StoryNavigatorState {
  const StoryNavigatorInitial({required super.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}

final class StoryNavigatorIndexUpdated extends StoryNavigatorState {
  const StoryNavigatorIndexUpdated({required super.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}

final class StoryNavigatorLastPage extends StoryNavigatorState {
  const StoryNavigatorLastPage({required super.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}

final class StoryNavigatorIndexUpdating extends StoryNavigatorState {
  const StoryNavigatorIndexUpdating({required super.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
