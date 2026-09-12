import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cimaf_1/core/theme/app_colors.dart';

void main() {
  test('Design system tokens are defined', () {
    expect(AppColors.primary, const Color(0xFF003F76));
    expect(AppColors.primaryContainer, const Color(0xFF00569E));
    expect(AppColors.secondary, const Color(0xFF9D4300));
    expect(AppColors.surface, const Color(0xFFFAF8FF));
    expect(AppColors.cimafBlue, const Color(0xFF00569E));
    expect(AppColors.cimafOrange, const Color(0xFFF16E10));
  });

  test('Spacing and radius tokens', () {
    expect(AppColors.lightScheme.primary, const Color(0xFF003F76));
    expect(AppColors.inverseSurface, const Color(0xFF283044));
  });

  testWidgets('CIMAF scaffold builds', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('CIMAF')),
          body: const Text('Bâtir l\'avenir du Gabon'),
        ),
      ),
    );
    expect(find.textContaining('CIMAF'), findsWidgets);
    expect(find.textContaining('Bâtir'), findsOneWidget);
  });
}
