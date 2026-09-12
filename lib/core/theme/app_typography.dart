import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  // Helpers
  static TextStyle _montserrat({
    required double size,
    required double height,
    required FontWeight weight,
    double? letterSpacing,
  }) =>
      GoogleFonts.montserrat(
        fontSize: size,
        height: height / size,
        fontWeight: weight,
        letterSpacing: letterSpacing,
      );

  static TextStyle _pjs({
    required double size,
    required double height,
    required FontWeight weight,
    double? letterSpacing,
  }) =>
      GoogleFonts.plusJakartaSans(
        fontSize: size,
        height: height / size,
        fontWeight: weight,
        letterSpacing: letterSpacing,
      );

  // Display
  static final displayHero = _montserrat(size: 56, height: 64, weight: FontWeight.w800, letterSpacing: -1.12);
  static final displayHeroMobile = _montserrat(size: 36, height: 44, weight: FontWeight.w800, letterSpacing: -0.36);

  // Headlines
  static final headlineXl = _montserrat(size: 40, height: 48, weight: FontWeight.w700, letterSpacing: -0.6);
  static final headlineXlMobile = _montserrat(size: 28, height: 36, weight: FontWeight.w700, letterSpacing: -0.28);
  static final headlineLg = _montserrat(size: 32, height: 40, weight: FontWeight.w700);
  static final headlineLgMobile = _montserrat(size: 24, height: 32, weight: FontWeight.w700);
  static final headlineMd = _montserrat(size: 24, height: 32, weight: FontWeight.w600);
  static final headlineSm = _montserrat(size: 20, height: 28, weight: FontWeight.w600);

  // Titles
  static final titleMd = _pjs(size: 18, height: 26, weight: FontWeight.w600);
  static final titleSm = _pjs(size: 16, height: 24, weight: FontWeight.w600);

  // Body
  static final bodyLg = _pjs(size: 18, height: 28, weight: FontWeight.w400);
  static final bodyMd = _pjs(size: 16, height: 24, weight: FontWeight.w400);
  static final bodySm = _pjs(size: 14, height: 20, weight: FontWeight.w400);

  // Labels
  static final labelLg = _pjs(size: 14, height: 20, weight: FontWeight.w600, letterSpacing: 0.28);
  static final labelMd = _pjs(size: 12, height: 16, weight: FontWeight.w600, letterSpacing: 0.48);
  static final labelTechnical = _montserrat(size: 11, height: 14, weight: FontWeight.w700, letterSpacing: 0.88);

  // Responsive helper
  static TextStyle responsive(BuildContext context, TextStyle desktop, TextStyle mobile) {
    final w = MediaQuery.of(context).size.width;
    return w < 768 ? mobile : desktop;
  }
}
