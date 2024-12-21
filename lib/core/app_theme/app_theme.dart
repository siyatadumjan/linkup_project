import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.pink, // Changed primary color to match the logo
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Montserrat Bold',
    appBarTheme: const AppBarTheme(
      backgroundColor:
          Color(0xFFFF66C4), // Set AppBar color to match the logo pink
      elevation: 0, // Optional: Removes shadow under the AppBar
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(),
        backgroundColor: const Color.fromARGB(255, 240, 139, 201),
      ),
    ), // Set pink color for elevated buttons
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color(0xFFFF66C4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color(0xFFFF66C4)),
      ),
      labelStyle: const TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
      prefixIconColor: const Color(0xFFFF66C4),
    ),
  );
}
