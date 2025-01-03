// Import necessary libraries
import 'package:flutter/material.dart';

// Define the AppTheme class
class AppTheme {
  // Define the hex color
  static const Color customColor = Color(0xFFE96E6E);

  // Define the lightTheme
  static ThemeData get lightTheme {
    // Return the ThemeData object
    return ThemeData(
      // Set the font family to Poppins
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
        // Set the background color of the bottom navigation bar to transparent
        type: BottomNavigationBarType.fixed, // WHY DID I HAVE TO PUT THIS IN ORDER FOR backgroundColor to work???
        backgroundColor: Colors.white,
        // Set the selected item color
        selectedItemColor: customColor,
        // Set the unselected item color
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}