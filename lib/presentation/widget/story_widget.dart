import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import '../../common/text_style.dart';
import '../../core/model/story/user_stories.dart';
import '../view/my_story_page.dart';

class StoryWidget extends StatefulWidget {
  final int currentIndex;
  final List<UserStories> stories;
  const StoryWidget({
    super.key,
    required this.stories,
    required this.currentIndex,
  });

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlineGradientButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyStoryPage(
                  initialPage: widget.currentIndex,
                ),
              ),
            );
          },
          gradient: const LinearGradient(
              colors: [Colors.red, Colors.white, Colors.red],
              stops: [0.2, 0.4, 0.9]),
          strokeWidth: 2.w,
          radius: Radius.circular(50.r),
          child: SizedBox(
            width: 80.r,
            height: 80.r,
            child: Padding(
              padding: EdgeInsets.all(2.r),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(30), // Image radius
                  child: Image.network(
                      widget.stories[widget.currentIndex].profilePicture,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          widget.stories[widget.currentIndex].userName,
          style: TextThemeStyle.s16w600White,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
