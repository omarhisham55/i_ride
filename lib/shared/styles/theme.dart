import 'package:flutter/material.dart';
import 'package:i_ride/shared/styles/colors.dart';

class IRideTheme {
  static ThemeData iRideTheme = ThemeData(
    primarySwatch: IRideColors.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    fontFamilyFallback: const ["Cairo"],
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: IRideColors.darkColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: IRideColors.darkColor),
    unselectedWidgetColor: Colors.white,
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.w300,
      ),
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(
        color: Color(0xFF81818A),
        fontSize: 17.0,
      ),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
