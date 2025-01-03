import 'package:flutter/material.dart';

class AppTheme {

  // Define the lightTheme only?
  static ThemeData get lightTheme {

    return ThemeData(
      fontFamily: 'Poppins',

      // Set the scaffold background color to transparent
      scaffoldBackgroundColor: Colors.transparent,

      // Set the app bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove the elevation to make the AppBar flat
      ),

      // Set the bottom navigation bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(

        type: BottomNavigationBarType.fixed, // WHY DID I HAVE TO PUT THIS IN ORDER FOR backgroundColor to work???
        backgroundColor: Colors.white,
        // Set the selected item color
        selectedItemColor: Color(0xFFE96E6E),
        // Set the unselected item color
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}