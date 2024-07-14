part of 'stories_bloc.dart';

@immutable
sealed class StoriesState extends Equatable {
  final List<UserStories> stories;

  const StoriesState({required this.stories});
}

final class StoriesInitial extends StoriesState {
  const StoriesInitial({required super.stories});

  @override
  List<Object?> get props => [stories];
}

final class StoriesStateLoading extends StoriesState {
  const StoriesStateLoading({required super.stories});

  @override
  List<Object?> get props => [stories];
}

final class StoriesStateUpdated extends StoriesState {
  const StoriesStateUpdated({required super.stories});

  @override
  List<Object?> get props => [stories];
}

final class StoriesStateError extends StoriesState {
  const StoriesStateError({required super.stories});

  @override
  List<Object?> get props => [stories];
}
