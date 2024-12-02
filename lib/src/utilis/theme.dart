import 'package:batminton_shop/src/utilis/widget_themes/elevated_button_theme.dart';
import 'package:batminton_shop/src/utilis/widget_themes/outlined_button_theme.dart';
import 'package:batminton_shop/src/utilis/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  static ThemeData lightTheme= ThemeData(
    brightness: Brightness.light,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlinedButtonTheme,
    // textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  );
  static ThemeData darkTheme= ThemeData(
      brightness: Brightness.dark,
      outlinedButtonTheme: TOutlineButtonTheme.darkOutlinedButtonTheme,
      // textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,

  );
}