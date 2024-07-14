import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/text_style.dart';

class PostWidget extends StatefulWidget {
  final String imagePath;
  const PostWidget({super.key, required this.imagePath});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              widget.imagePath,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.h,
                ),
                Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                  size: 24.h,
                ),
                Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 24.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            '1,56,345 Views',
            style: TextThemeStyle.s14w600White,
          )
        ],
      ),
    );
  }
}
