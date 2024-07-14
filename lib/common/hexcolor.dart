import 'dart:ui';

import 'package:flutter/material.dart';

/// Class to convert hexcolor to color
class HexColor extends Color {
  /// HexColor constructor
  HexColor(String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    var color = hexColor;
    color = color.toUpperCase().replaceAll('#', '');
    if (color.length == 6) {
      color = 'FF$color';
    }
    return int.parse(color, radix: 16);
  }
}

class HexColors {
  static String darkBackgroundColor = '#000000';
  static String white = '#FFFFFF';
  static String storyBackgroundColor = '#798FB1';
}
