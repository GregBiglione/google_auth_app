import 'package:flutter/material.dart';
import 'package:google_auth_app/presentation/resource/font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
    FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// Light style -----------------------------------------------------------------

TextStyle getLightStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.light,
    color,
  );
}

// Regular style ---------------------------------------------------------------

TextStyle getRegularStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.regular,
    color,
  );
}

// Medium style ----------------------------------------------------------------

TextStyle getMediumStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.medium,
    color,
  );
}

// SemiBold style --------------------------------------------------------------

TextStyle getSemiBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.semiBold,
    color,
  );
}

// Bold style ------------------------------------------------------------------

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.bold,
    color,
  );
}