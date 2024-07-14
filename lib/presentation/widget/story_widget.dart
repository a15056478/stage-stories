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
  // final StoryController storyController = StoryController();
  // List<Widget> createStoryViews() {
  //   List<Widget> _list = [];
  //   widget.stories.forEach((story) {
  //     List<StoryItem> _tempList = [];

  //     story.stories.forEach((element) {
  //       if (element.type == 'text') {
  //         _tempList.add(StoryItem.text(
  //             title: element.content,
  //             backgroundColor: HexColor(HexColors.storyBackgroundColor)));
  //       }
  //       if (element.type == 'image') {
  //         _tempList.add(StoryItem.inlineImage(
  //             url: element.content, controller: storyController));
  //       }
  //     });

  //     _list.add(Stack(
  //       children: [
  //         StoryView(
  //           storyItems: _tempList,
  //           controller: storyController,
  //           onComplete: () {
  //             dPrint(
  //                 '${widget.stories[widget.stories.length - 1].userId}  hello  ${widget.currentIndex}');

  //             // if (widget.stories.length == _list.length + 2) {
  //             //   BlocProvider.of<StoryNavigatorBloc>(context)
  //             //       .add(StoryNavigatorEventLastPage());
  //             // }
  //             BlocProvider.of<StoryNavigatorBloc>(context).add(
  //                 StoryNavigatorEventMoveNext(
  //                     currentIndexIndex: widget.currentIndex));
  //           },
  //         ),
  //         Positioned(
  //           top: 80.h,
  //           right: 0,
  //           child: IconButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             icon: Icon(
  //               Icons.close,
  //               color: Colors.white,
  //               weight: 5.w,
  //               size: 30.h,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ));
  //   });
  //   return _list;
  // }

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
                  // storyView: createStoryViews(),
                ),
              ),
            );
          },
          child: Container(
            width: 80.r,
            height: 80.r,
            child: Padding(
              padding: EdgeInsets.all(2.r),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(30), // Image radius
                  child: Image.network(
                      widget.stories[widget.currentIndex].profilePicture,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          gradient: const LinearGradient(
              colors: [Colors.red, Colors.white, Colors.red],
              stops: [0.2, 0.4, 0.9]),
          strokeWidth: 2.w,
          radius: Radius.circular(50.r),
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
