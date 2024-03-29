import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme,
    );
  }

  static ColorScheme get _colorScheme {
    const primaryColor = Color(0xFF909CDF);
    const secondaryColor = Color(0xFF9C254D);

    final seeds = FlexSchemeColor.from(
      primary: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.dark,
    );

    final colors = FlexThemeData.dark(
      useMaterial3: true,
      colors: seeds,
    ).colorScheme;

    return colors;
  }

  static TextTheme get _textTheme {
    const textTheme = TextTheme();

    final bodyFont = GoogleFonts.ibmPlexSansTextTheme(textTheme);
    final headingFont = GoogleFonts.syneMonoTextTheme(textTheme);

    return bodyFont.copyWith(
      displayLarge: headingFont.displayLarge,
      displayMedium: headingFont.displayMedium,
      displaySmall: headingFont.displaySmall,
      headlineLarge: headingFont.headlineLarge,
      headlineMedium: headingFont.headlineMedium,
      headlineSmall: headingFont.headlineSmall,
      bodyLarge: bodyFont.bodyLarge,
      bodyMedium: bodyFont.bodyMedium,
      bodySmall: bodyFont.bodySmall,
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.2),
      enabledBorder: _enabledBorder,
      focusedBorder: _focusedBorder,
      disabledBorder: _disabledBorder,
    );
  }

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  static InputBorder get _enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(color: Colors.transparent),
      );

  static InputBorder get _focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: _colorScheme.secondary),
      );

  static InputBorder get _disabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      );
}
