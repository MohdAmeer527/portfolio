import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define common colors
  static const Color primaryColor = Color(0xFF4F47E5); // Purple
  static const Color blackColor = Color(0xFF1E1E1E);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color cardLightColor = Color(0xFFF9FAFB);
  static const Color cardDarkColor = Color(0xFF1F2937);

  // Light Text Theme
  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: primaryColor,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: blackColor,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: blackColor,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: blackColor,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: blackColor,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: blackColor,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Colors.grey,
    ),
  );

  // Dark Text Theme
  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: whiteColor,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: whiteColor,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: whiteColor,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: whiteColor,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: whiteColor,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: whiteColor,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Colors.grey[400],
    ),
  );

  // Common card theme
  static CardTheme _cardTheme(
      Color color, double elevation, Color shadowColor) {
    return CardTheme(
      elevation: elevation,
      shadowColor: shadowColor,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  // Common InputDecorationTheme
  static InputDecorationTheme _inputDecorationTheme(
      {required Color fillColor,
      required Color borderColor,
      required Color focusedBorderColor}) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.all(7),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide:
            BorderSide(width: 0.8, color: Color.fromARGB(255, 228, 228, 228)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 0.8, color: primaryColor),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 0.8, color: Colors.red),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 0.8, color: Colors.red),
      ),
      errorStyle: const TextStyle(color: Colors.red),
      hintStyle: TextStyle(color: Colors.grey[600]),
      labelStyle: TextStyle(color: borderColor),
    );
  }

  // Light Theme
  static ThemeData get lightTheme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: whiteColor,
        ),
        primaryColor: primaryColor,
        cardTheme: _cardTheme(cardLightColor, 0, Colors.black26),
        textTheme: lightTextTheme,
        inputDecorationTheme: _inputDecorationTheme(
          fillColor: whiteColor,
          borderColor: Colors.grey,
          focusedBorderColor: primaryColor,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: whiteColor,
        ),
        iconTheme: const IconThemeData(
          color: blackColor,
        ),

      );

  // Dark Theme
  
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: blackColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: blackColor,
        ),
        primaryColor: primaryColor,
        cardTheme: _cardTheme(cardDarkColor, 0, Colors.black54),
        textTheme: darkTextTheme,
        inputDecorationTheme: _inputDecorationTheme(
          fillColor: const Color(0xff374151),
          borderColor: Colors.grey[700]!,
          focusedBorderColor: primaryColor,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: blackColor,
        ),
        iconTheme: const IconThemeData(
          color: whiteColor,
        ),
      );
}
