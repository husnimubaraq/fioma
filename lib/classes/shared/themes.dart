part of 'shared.dart';

class Themes {
  static const double defaultMargin = 20;

  //badge color
  static const Color primaryColor = Color(0xff007bff);
  static const Color infoColor = Color(0xff17a2b8);
  static const Color successColor = Color(0xff28a745);
  static const Color warningColor = Color(0xffeb6709);
  static const Color dangerColor = Color(0xffdc3545);

  //theme color
  static const Color purpleColor = Color(0xff5843BE);
  static const Color orangeColor = Color(0xffFF9376);
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);
  static const Color greyColor = Color(0xff82868E);
  static const Color darkColor = Color(0xff343a40);
  static const Color backgroundColor = Color(0xFFFAFAFC);
  static const Color softGreyColor = Color(0xFEEEF1F8);

  static const double headerFontSize = 20;
  static const double titleFontSize = 22;
  static const double subtitleFontSize = 18;
  static const double regularFontSize = 16;
  static const double lightFontSize = 14;

  static const FontWeight boldFontWeight = FontWeight.w700;
  static const FontWeight mediumFontWeight = FontWeight.w500;
  static const FontWeight regularFontWeight = FontWeight.w400;
  static const FontWeight lightFontWeight = FontWeight.w300;

  //theme text style
  static TextStyle headerTextStyle = GoogleFonts.poppins(
      fontWeight: mediumFontWeight,
      color: whiteColor,
      fontSize: headerFontSize);

  static TextStyle titleTextStyle = GoogleFonts.poppins(
      fontWeight: mediumFontWeight, color: blackColor, fontSize: titleFontSize);

  static TextStyle subTitleTextStyle = GoogleFonts.poppins(
      fontWeight: regularFontWeight,
      color: greyColor,
      fontSize: subtitleFontSize);

  static TextStyle blackTextStyle = GoogleFonts.poppins(
      fontWeight: regularFontWeight,
      color: blackColor,
      fontSize: regularFontSize);

  static TextStyle whiteTextStyle = GoogleFonts.poppins(
      fontWeight: regularFontWeight,
      color: whiteColor,
      fontSize: regularFontSize);

  static TextStyle greyTextStyle = GoogleFonts.poppins(
      fontWeight: lightFontWeight, color: greyColor, fontSize: regularFontSize);
}
