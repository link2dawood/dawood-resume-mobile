import 'package:flutter/material.dart';

/// Shared visual theme for the resume app.
class AppTheme {
  static const Color navy = Color(0xFF1E1973);
  static const Color ink = Color(0xFF1E1E1E);
  static const Color muted = Color(0xFF737373);

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(seedColor: navy);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme.copyWith(primary: navy),
      scaffoldBackgroundColor: const Color(0xFFF4F4F7),
      appBarTheme: const AppBarTheme(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: Color(0xFFE9E9F2),
        labelStyle: TextStyle(color: navy, fontSize: 12),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: ink, height: 1.45),
        bodySmall: TextStyle(color: muted),
      ),
    );
  }
}
