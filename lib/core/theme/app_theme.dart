import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF001e40);
  static const Color onPrimary = Color(0xFFffffff);
  static const Color primaryContainer = Color(0xFF003366);
  static const Color onPrimaryContainer = Color(0xFF799dd6);

  static const Color secondary = Color(0xFF705d00);
  static const Color onSecondary = Color(0xFFffffff);
  static const Color secondaryContainer = Color(0xFFfcd400);
  static const Color onSecondaryContainer = Color(0xFF6e5c00);

  static const Color tertiary = Color(0xFF00240a);
  static const Color onTertiary = Color(0xFFffffff);
  static const Color tertiaryContainer = Color(0xFF003c15);
  static const Color onTertiaryContainer = Color(0xFF4bae60);

  static const Color error = Color(0xFFba1a1a);
  static const Color onError = Color(0xFFffffff);
  static const Color errorContainer = Color(0xFFffdad6);
  static const Color onErrorContainer = Color(0xFF93000a);

  static const Color background = Color(0xFFf7fafc);
  static const Color onBackground = Color(0xFF181c1e);
  static const Color surface = Color(0xFFf7fafc);
  static const Color onSurface = Color(0xFF181c1e);
  static const Color surfaceVariant = Color(0xFFe0e3e5);
  static const Color onSurfaceVariant = Color(0xFF43474f);

  static const Color outline = Color(0xFF737780);
  static const Color outlineVariant = Color(0xFFc3c6d1);

  static const Color surfaceContainerHighest = Color(0xFFe0e3e5);
  static const Color surfaceContainerHigh = Color(0xFFe5e9eb);
  static const Color surfaceContainer = Color(0xFFebeef0);
  static const Color surfaceContainerLow = Color(0xFFf1f4f6);
  static const Color surfaceContainerLowest = Color(0xFFffffff);

  static ThemeData get lightTheme {
    final textTheme = GoogleFonts.publicSansTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: surface,
        onSurface: onSurface,
        surfaceContainerHighest: surfaceContainerHighest,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
      ),
      textTheme: textTheme,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceContainerLowest,
        foregroundColor: primaryContainer,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: primaryContainer,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: primaryContainer),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryContainer,
          foregroundColor: onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceContainerLowest,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: primaryContainer, width: 2),
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(color: onSurfaceVariant),
      ),
      cardTheme: CardThemeData(
        color: surfaceContainerLowest,
        elevation: 1,
        shadowColor: primaryContainer.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: surfaceVariant, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),
    );
  }
}
