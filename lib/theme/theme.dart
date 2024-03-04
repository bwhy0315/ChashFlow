import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness:  Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.black
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white
  )
);