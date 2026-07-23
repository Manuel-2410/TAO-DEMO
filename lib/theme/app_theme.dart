import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF2E5E3A);

  static const Color secondary = Color(0xFFD4B06A);

  static const Color background = Color(0xFFF5F7F8);

  static const Color cardColor = Colors.white;

  static ThemeData lightTheme = _theme(Brightness.light);

  static ThemeData darkTheme = _theme(Brightness.dark);

  static ThemeData _theme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: isDark ? const Color(0xFF101512) : background,
      canvasColor: isDark ? const Color(0xFF101512) : background,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
      ),
      cardTheme: CardThemeData(
        color: isDark ? const Color(0xFF1A211D) : cardColor,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? const Color(0xFF202923) : Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: isDark ? const Color(0xFF1A211D) : Colors.white,
      ),
      dividerColor: isDark ? const Color(0xFF3A463E) : const Color(0xFFE0E5EA),
    );
  }
}
