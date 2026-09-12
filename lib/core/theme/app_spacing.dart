import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();
  static const double spaceXs = 4;
  static const double spaceSm = 8;
  static const double spaceMd = 16;
  static const double spaceLg = 24;
  static const double spaceXl = 40;
  static const double gutter = 24;
  static const double gutterMobile = 16;
  static const double margin = 48;
  static const double marginMobile = 20;
  static const double maxContentWidth = 1360;
  static const double contentMaxWidth = 1280;

  // Breakpoints
  static const double bpMobile = 767;
  static const double bpTablet = 1199;
  static const double bpDesktop = 1200;

  static bool isMobile(BuildContext c) => MediaQuery.of(c).size.width <= bpMobile;
  static bool isTablet(BuildContext c) {
    final w = MediaQuery.of(c).size.width;
    return w > bpMobile && w <= bpTablet;
  }

  static bool isDesktop(BuildContext c) => MediaQuery.of(c).size.width >= bpDesktop;

  static EdgeInsets pagePadding(BuildContext context) {
    if (isMobile(context)) return const EdgeInsets.symmetric(horizontal: marginMobile);
    if (isTablet(context)) return const EdgeInsets.symmetric(horizontal: 32);
    return const EdgeInsets.symmetric(horizontal: 48);
  }
}

class AppRadius {
  AppRadius._();
  static const double sm = 4; // 0.25rem
  static const double md = 6;
  static const double lg = 8; // 0.5rem
  static const double xl = 12; // 0.75rem
  static const double full = 9999;
}

class AppShadows {
  AppShadows._();
  static const card = BoxShadow(color: Color(0x0A0F172A), blurRadius: 8, offset: Offset(0, 2));
  static const cardHover = BoxShadow(color: Color(0x140F172A), blurRadius: 24, offset: Offset(0, 10));
  static const float = BoxShadow(color: Color(0x1F00569E), blurRadius: 32, offset: Offset(0, 20));
}
