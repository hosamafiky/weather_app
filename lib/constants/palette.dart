import 'package:flutter/material.dart';

class Palette {
  static const Color primaryColor = Color(0xff90B2F9);
  static const Color secondaryColor = Color(0xff90B2F8);
  static final shader = const LinearGradient(
    colors: [
      Color(0xFFABCFF2),
      Color(0xFF9AC6F3),
    ],
  ).createShader(const Rect.fromLTRB(0.0, 0.0, 200.0, 70.0));
  static const kGreyColor = Color(0xFFE0E8FB);
}
