import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness:  Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white70,
    primary: Colors.white
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Color.fromARGB(255, 41, 41, 41)
  )
);