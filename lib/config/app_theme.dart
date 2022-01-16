import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
      primaryColor: Colors.green,
      iconTheme: const IconThemeData(color: Colors.black),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent));
}
