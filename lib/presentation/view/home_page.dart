import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/hexcolor.dart';
import '../../common/image_path.dart';
import '../bloc/stories/stories_bloc.dart';
import '../widget/post_widget.dart';
import '../widget/story_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StoriesBloc storiesBloc;

  @override
  void initState() {
    storiesBloc = BlocProvider.of<StoriesBloc>(context)
      ..add(StoriesEventLoadData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(HexColors.darkBackgroundColor),
      appBar: AppBar(
        leadingWidth: 150.w,
        toolbarHeight: 65.h,
        leading: Image.asset(
          ImagePath.LOGO,
          height: 40.h,
        ),
        backgroundColor: HexColor(HexColors.darkBackgroundColor),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 125.h,
            child: Center(
              child: BlocBuilder<StoriesBloc, StoriesState>(
                builder: (context, state) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 16.w,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.stories.length,
                    itemBuilder: (context, i) => StoryWidget(
                      currentIndex: i,
                      stories: state.stories,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          PostWidget(
            imagePath: ImagePath.POST1,
          ),
          SizedBox(
            height: 24.h,
          ),
          PostWidget(
            imagePath: ImagePath.POST2,
          ),
        ],
      ),
    );
  }
}
