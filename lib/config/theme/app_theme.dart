import 'package:flutter/material.dart';
import 'package:subsly/config/theme/light_color_scheme.dart';
import 'package:subsly/config/theme/dark_color_scheme.dart';

class AppTheme {

  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});
  

  ThemeData  getTheme() => ThemeData(
       
        colorScheme: isDarkMode ? darkColorScheme : lightColorScheme,
       
      );
}