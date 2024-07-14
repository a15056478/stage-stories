import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final String content;
  final String id;
  final String type;

  Story({
    required this.content,
    required this.id,
    required this.type,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        content: json["content"],
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "id": id,
        "type": type,
      };

  @override
  List<Object?> get props => [content, id, type];
}
