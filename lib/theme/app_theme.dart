import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool isDark = brightnessValue == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0XFF2862F5),
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
  }
}
