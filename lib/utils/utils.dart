import 'package:flutter/material.dart';
import 'dart:math';

class BenchMarkUtils {
  var _currentMillis;

  BenchMarkUtils() {
    resetTime();
  }

  void dump(String prefix) {
    print(prefix +
        " Took: " +
        (DateTime.now().millisecondsSinceEpoch - _currentMillis).toString() +
        " Millis");
    resetTime();
  }

  void resetTime() {
    _currentMillis = DateTime.now().millisecondsSinceEpoch;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

final _random = new Random();

int nextRandomInt(int min, int max) => min + _random.nextInt(max - min);
