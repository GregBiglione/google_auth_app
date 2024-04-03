import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.fromHex("#4285F4");
  static Color primaryOpacity70 = HexColor.fromHex("#B34285F4");
  static Color primaryDark = HexColor.fromHex("#1266F1");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color black = HexColor.fromHex("#000000");
  static Color googleBorderColor = HexColor.fromHex("#B4B6B6");
  static Color googleTextColor = HexColor.fromHex("#7F7F7F");
  static Color disableColor = HexColor.fromHex("#B5B3B3");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");

    if(hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    
    return Color(int.parse(hexColorString, radix: 16));
  }
}