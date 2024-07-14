import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stage_stories/presentation/bloc/stories/stories_bloc.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../common/hexcolor.dart';
import '../../main.dart';
import '../bloc/story navigator/story_navigator_bloc.dart';

class MyStoryPage extends StatefulWidget {
  final int initialPage;
  const MyStoryPage({
    super.key,
    required this.initialPage,
  });

  @override
  State<MyStoryPage> createState() => _MyStoryPageState();
}

class _MyStoryPageState extends State<MyStoryPage> {
  final CarouselSliderController _sliderController = CarouselSliderController();
  final StoryController storyController = StoryController();
  late StoriesBloc storiesBloc;
  List<Widget> storiesWidget = [];

  /// Function to return story views to slider
  List<Widget> createStoryViews() {
    List<Widget> _list = [];

    // Iterating through users
    for (int i = 0; i < storiesBloc.state.stories.length; i++) {
      List<StoryItem> _tempList = [];

      // Iterating through user story
      storiesBloc.state.stories[i].stories.forEach((element) {
        if (element.type == 'text') {
          _tempList.add(StoryItem.text(
              title: element.content,
              backgroundColor: HexColor(HexColors.storyBackgroundColor)));
        }
        if (element.type == 'image') {
          _tempList.add(StoryItem.inlineImage(
              url: element.content, controller: storyController));
        }
      });
      // Creating story view for each user
      _list.add(Stack(
        children: [
          StoryView(
            storyItems: _tempList,
            controller: storyController,
            onComplete: () => storiesBloc.state.stories.length == i + 1
                ? BlocProvider.of<StoryNavigatorBloc>(context)
                    .add(StoryNavigatorEventLastPage(currentIndexIndex: i))
                : BlocProvider.of<StoryNavigatorBloc>(context)
                    .add(StoryNavigatorEventMoveNext(currentIndexIndex: i)),
          ),
          Positioned(
            top: 80.h,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
                weight: 5.w,
                size: 30.h,
              ),
            ),
          ),
        ],
      ));
    }
    // Returning list of story view
    return _list;
  }

  @override
  void initState() {
    storiesBloc = BlocProvider.of<StoriesBloc>(context);
    // Initializing story views
    storiesWidget = createStoryViews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<StoryNavigatorBloc, StoryNavigatorState>(
          bloc: BlocProvider.of<StoryNavigatorBloc>(context),
          listener: (context, state) {
            if (state is StoryNavigatorIndexUpdated) {
              _sliderController.nextPage(const Duration(milliseconds: 100));
            }
            if (state is StoryNavigatorLastPage) {
              Navigator.pop(context);
            }
          },
          child: CarouselSlider(
            controller: _sliderController,
            initialPage: widget.initialPage,
            enableAutoSlider: false,
            slideTransform: const CubeTransform(),
            onSlideChanged: (value) {
              dPrint(value);
            },
            children: storiesWidget,
          )),
    );
  }
}
