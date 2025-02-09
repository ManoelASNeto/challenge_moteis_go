import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get titleStyle => const TextStyle(
        fontSize: 20,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w300,
      );
}
