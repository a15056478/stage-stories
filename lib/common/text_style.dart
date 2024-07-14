import 'package:flutter/material.dart';
import 'package:stage_stories/common/hexcolor.dart';

abstract class TextThemeStyle {
  //Black
  static TextStyle s16w600White = TextStyle(
    color: HexColor(
      HexColors.white,
    ),
    fontSize: 16,
    height: 1.6,
    fontWeight: FontWeight.w600,
  );

  static TextStyle s14w600White = TextStyle(
    color: HexColor(
      HexColors.white,
    ),
    fontSize: 14,
    height: 1.6,
    fontWeight: FontWeight.w600,
  );
}
