import 'package:flutter/material.dart';

// Paleta inspirada en la imagen
const Color kPrimaryColor = Color(0xFFFFC107); // Amarillo
const Color kAccentColor = Color(0xFFFFA726); // Naranja pastel
const Color kWhiteColor = Colors.white;
const Color kBackgroundColor = Color(0xFFFFF6E9); // Fondo crema
const Color kShadowColor = Color(0x1A000000); // Sombra suave

final ThemeData fastFoodTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: kWhiteColor,
    elevation: 0,
    iconTheme: IconThemeData(color: kPrimaryColor),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      elevation: 2,
      shadowColor: kShadowColor,
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
    ),
  ),
  cardTheme: CardThemeData(
    color: kWhiteColor,
    elevation: 4,
    margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    shadowColor: kShadowColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    headlineMedium: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
    titleMedium: TextStyle(
      color: kPrimaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    bodyLarge: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
  ),
  iconTheme: IconThemeData(color: kAccentColor, size: 28),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kWhiteColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.black38),
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kWhiteColor,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: kAccentColor.withOpacity(0.6),
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
  ),
);
