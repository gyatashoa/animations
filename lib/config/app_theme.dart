import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
      primaryColor: Colors.green,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent));
}
