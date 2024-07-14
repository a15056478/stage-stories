part of 'stories_bloc.dart';

@immutable
sealed class StoriesEvent extends Equatable {}

class StoriesEventUpdateData extends StoriesEvent {
  final int index;
  final int userId;
  final int storyId;

  StoriesEventUpdateData({
    required this.userId,
    required this.storyId,
    required this.index,
  });
  @override
  List<Object?> get props => [userId, storyId, userId];
}

class StoriesEventLoadData extends StoriesEvent {
  StoriesEventLoadData();
  @override
  List<Object?> get props => [];
}
