import 'package:flutter/material.dart';
import 'package:stylesh/core/theme/dark_theme.dart';
import 'package:stylesh/core/theme/light_theme.dart';

abstract class AppTheme { 
  static ThemeData get getlightTheme => lightTheme;
  static ThemeData get getdarkTheme => darkTheme;
}