import 'package:flutter/material.dart';
import 'package:google_auth_app/presentation/resource/color_manager.dart';
import 'package:google_auth_app/presentation/resource/font_manager.dart';
import 'package:google_auth_app/presentation/resource/style_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // App colors --------------------------------------------------------------
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.disableColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.disableColor,
    ),

    // Text theme --------------------------------------------------------------
    textTheme: TextTheme(
      // Headline 1 ------------------------------------------------------------
      displayMedium: getRegularStyle(
        fontSize: FontSize.s24,
        color: ColorManager.white,
      ),
      // Headline 2 ------------------------------------------------------------
      displaySmall: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
      ),
      // Headline 6 ------------------------------------------------------------
      titleMedium: getRegularStyle(
        fontSize: FontSize.s18,
        color: ColorManager.white,
      ),
    ),
  );
}