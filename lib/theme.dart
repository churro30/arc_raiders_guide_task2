import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color backgroundColor = const Color(0xFF111418);
  static Color scaffoldBackgroundColor = const Color(0xFF07090B);

  static Color textColor = const Color(0xFFEAE0CD);
  static Color forgroundText = const Color(0xFFFAFAFA);
  static Color highlightColor = const Color(0xFF3F57A1);

  static Color primaryRed = const Color(0xFFB0413B);
  static Color primaryYellow = const Color(0xFFDCA23E);
  static Color primaryGreen = const Color(0xFF49A06F);
  static Color primaryCyan = const Color(0xFF3EAFD3);
}

ThemeData primaryTheme = ThemeData(
  // Seed Color
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),

  // AppBar Theme Colors
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    foregroundColor: AppColors.textColor,
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
  ),

  // Scaffold Color
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,

  // Text Theme
  textTheme: GoogleFonts.barlowTextTheme().copyWith(
    bodyMedium: GoogleFonts.barlow(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),

    headlineMedium: GoogleFonts.barlow(
      textStyle: TextStyle(
        color: AppColors.textColor,
        fontSize: 20,
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
      ),
    ),

    titleMedium: GoogleFonts.barlow(
      color: AppColors.primaryRed,
      fontSize: 22,
      letterSpacing: -0.1,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Card Theme
  cardTheme: CardThemeData(
    margin: const EdgeInsets.only(bottom: 16),
    color: AppColors.backgroundColor.withValues(alpha: 0.5),
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
  ),
);
