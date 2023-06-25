import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor:  Colors.blueAccent,

    //text styling
    textTheme:  const TextTheme(
      titleLarge: TextStyle(fontSize: 26, fontFamily: 'Aloevera', color: Colors.blueAccent,),


    ),
  );
}