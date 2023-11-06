import 'package:flutter/material.dart';

class AppThemeData {
  // Colors: Main Colors
  static const Color primaryColor = Color(0xff6750A4);
  static const Color secondaryColor = Color(0xffE8DEF8);
  static const Color scaffoldColor = Color(0xffFFFAF1);
  static const Color backgroundWhite = Colors.white;
  static const Color backgroundBlack = Colors.black;
  static const Color backgroundGrey = Colors.grey;
  static const Color listTileBackgroundColor = Color(0xffCAC4D0);

  // Colors: Text
  static const textPrimary = Colors.black;
  static const textSecondary = Colors.white;
  static const textBlack = Color(0xff212121);
  static const textGrey = Color(0xff1D1B20);
  static const textError = Colors.red;

  // Colors: Buttons and Icons
  static const buttonPrimary = Color(0xff3D4648);
  static const buttonSecondary = Color(0xff1D1B20);
  static const iconPrimary = primaryColor;
  static const iconGrey = Color(0xff616161);
  static const iconWhite = Color(0xffFFFFFF);
  static const iconBlack = Color(0xff212121);

  // Radius
  static const double fieldRadius = 5;

  // Fields side color
  static const Color fieldSideColor = AppThemeData.buttonPrimary;

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldColor,
    fontFamily: 'Roboto',
    iconTheme: const IconThemeData(color: iconPrimary),
    colorScheme: const ColorScheme.light().copyWith(background: scaffoldColor),
    inputDecorationTheme:  InputDecorationTheme(
      fillColor: AppThemeData.scaffoldColor,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(fieldRadius),
        borderSide: const BorderSide(color: fieldSideColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppThemeData.fieldSideColor),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldRadius),
          borderSide: const BorderSide(color: fieldSideColor, width: 1)
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(fieldRadius),
        borderSide: const BorderSide(color: textError),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(fieldRadius),
      ),
      hintStyle: const TextStyle(
        color: textGrey,
      ),
      labelStyle: const TextStyle(
        color: textGrey,
      ),
    ),
    appBarTheme:  AppBarTheme(
      backgroundColor: listTileBackgroundColor.withOpacity(.3),
      titleTextStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme:  const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(buttonPrimary),
        elevation: MaterialStatePropertyAll(2.0),
      ),
    ),
  );
}