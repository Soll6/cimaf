import 'package:flutter/material.dart';

/// CIMAF Gabon — Design System Colors
/// Fidèle au DESIGN.md Stitch (FIDELITY variant)
/// Source: stitch_get_project designTheme.namedColors + DESIGN.md
class AppColors {
  AppColors._();

  // === Brand primaires ===
  static const cimafBlue = Color(0xFF00569E); // primary-container / customColor
  static const cimafBlueDark = Color(0xFF003F76); // primary
  static const cimafBlueDeep = Color(0xFF001C3A); // on-primary-fixed
  static const cimafOrange = Color(0xFFF16E10); // Figma secondary -> approx fd771c
  static const cinderSlate = Color(0xFF334155); // tertiary override -> 313f53
  static const carbonNeutral = Color(0xFF0F172A);

  // === Material 3 tokens (fidèles Stitch) ===
  static const primary = Color(0xFF003F76);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFF00569E);
  static const onPrimaryContainer = Color(0xFFACCCFF);
  static const primaryFixed = Color(0xFFD4E3FF);
  static const primaryFixedDim = Color(0xFFA5C8FF);
  static const onPrimaryFixed = Color(0xFF001C3A);
  static const onPrimaryFixedVariant = Color(0xFF004785);
  static const inversePrimary = Color(0xFFA5C8FF);

  static const secondary = Color(0xFF9D4300);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFFFD771C);
  static const onSecondaryContainer = Color(0xFF5C2400);
  static const secondaryFixed = Color(0xFFFFDBCA);
  static const secondaryFixedDim = Color(0xFFFFB690);
  static const onSecondaryFixed = Color(0xFF341100);
  static const onSecondaryFixedVariant = Color(0xFF783200);

  static const tertiary = Color(0xFF313F53);
  static const onTertiary = Color(0xFFFFFFFF);
  static const tertiaryContainer = Color(0xFF48566B);
  static const onTertiaryContainer = Color(0xFFBDCBE4);
  static const tertiaryFixed = Color(0xFFD5E3FD);
  static const tertiaryFixedDim = Color(0xFFB9C7E0);
  static const onTertiaryFixed = Color(0xFF0D1C2F);
  static const onTertiaryFixedVariant = Color(0xFF3A485C);

  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);

  static const surface = Color(0xFFFAF8FF);
  static const onSurface = Color(0xFF131B2E);
  static const surfaceVariant = Color(0xFFDAE2FD);
  static const onSurfaceVariant = Color(0xFF424751);
  static const surfaceDim = Color(0xFFD2D9F4);
  static const surfaceBright = Color(0xFFFAF8FF);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFF2F3FF);
  static const surfaceContainer = Color(0xFFEAEDFF);
  static const surfaceContainerHigh = Color(0xFFE2E7FF);
  static const surfaceContainerHighest = Color(0xFFDAE2FD);
  static const inverseSurface = Color(0xFF283044);
  static const inverseOnSurface = Color(0xFFEEF0FF);
  static const outline = Color(0xFF727782);
  static const outlineVariant = Color(0xFFC2C6D2);
  static const surfaceTint = Color(0xFF185FA8);
  static const background = Color(0xFFFAF8FF);
  static const onBackground = Color(0xFF131B2E);

  // === Sémantiques métier ===
  static const success = Color(0xFF0E7A3A);
  static const warning = secondaryContainer;

  // === Light ColorScheme ===
  static const lightScheme = ColorScheme(
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
    scrim: inverseSurface,
    inverseSurface: inverseSurface,
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );
}
