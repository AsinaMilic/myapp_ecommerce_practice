import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Poppins',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}