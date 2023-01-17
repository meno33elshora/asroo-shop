import 'package:flutter/material.dart';

const Color mainColor = Color(0xff00BE84);
const Color black = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color darkBrown = Color(0xff685959);
const Color  lightBrown = Color(0xffADA79B);
const Color semiBrown = Color(0xffA5947F);
const Color lightGreen = Color(0xff738B71);
const Color darkBrown2 = Color(0xff6D454D);
const Color purple = Color(0xff6132e4);
const Color green = Color(0xff73bc65);
const Color blue = Color(0xff5f95ef);
const Color lightRed = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: black,
    backgroundColor: black,
    brightness: Brightness.dark,
  );
}
