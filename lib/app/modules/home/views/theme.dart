import 'package:flutter/material.dart';

const Color bluishclr = Color(0xff4e5ae8);
const Color yellowclr = Color(0xffffb746);
const Color pinkclr = Color(0xffff4667);
const Color white = Colors.white;
const primaryclr = bluishclr;
const Color darkGreyClr = Color(0xff121212);
Color darkHeaderClr = Colors.grey[800]!;

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: Colors.yellow,
    brightness: Brightness.dark,
  );
}

