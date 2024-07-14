import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:stage_stories/core/model/story/story.dart';

UserStories userFromJson(String str) => UserStories.fromJson(json.decode(str));

String userToJson(UserStories data) => json.encode(data.toJson());

class UserStories extends Equatable {
  final List<Story> stories;
  final String userId;
  final String profilePicture;
  final String userName;

  UserStories({
    required this.stories,
    required this.userId,
    required this.profilePicture,
    required this.userName,
  });

  factory UserStories.fromJson(Map<String, dynamic> json) => UserStories(
        stories:
            List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
        userId: json["userId"],
        profilePicture: json["profilePicture"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "stories": List<dynamic>.from(stories.map((x) => x.toJson())),
        "userId": userId,
        "profilePicture": profilePicture,
        "userName": userName,
      };

  @override
  List<Object?> get props => [
        stories,
        userId,
        profilePicture,
        userName,
      ];
}
