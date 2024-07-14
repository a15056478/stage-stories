part of 'stories_bloc.dart';

@immutable
sealed class StoriesState extends Equatable {
  final List<UserStories> stories;

  StoriesState({required this.stories});
}

final class StoriesInitial extends StoriesState {
  StoriesInitial({required super.stories});

  @override
  List<Object?> get props => [stories];
}

final class StoriesStateLoading extends StoriesState {
  StoriesStateLoading({required super.stories});

  @override
  List<Object?> get props => [stories];
}

final class StoriesStateUpdated extends StoriesState {
  StoriesStateUpdated({required super.stories});

  @override
  List<Object?> get props => [stories];
}

final class StoriesStateError extends StoriesState {
  StoriesStateError({required super.stories});

  @override
  List<Object?> get props => [stories];
}
