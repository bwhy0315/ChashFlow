import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness:  Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
    secondary: Color.fromARGB(115, 211, 211, 211),
    error: Color.fromARGB(172, 230, 230, 230),
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    secondary: Color.fromARGB(115, 79, 79, 79),
    error: Color.fromARGB(172, 139, 139, 139),
  )
);