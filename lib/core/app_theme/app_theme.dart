import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primarySwatch: Colors.orange,
      scaffoldBackgroundColor: Colors.grey[200],
      fontFamily: 'Montserrat Bold',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(textStyle: const TextStyle())));
}
