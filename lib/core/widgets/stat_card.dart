import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String suffix;
  final String description;
  final Color accent;
  const StatCard({super.key, required this.label, required this.value, this.suffix = '', required this.description, required this.accent});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Color(0x0A0F172A), blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Stack(children: [
        Positioned(left: 0, top: 14, child: Container(width: 5, height: 36, decoration: BoxDecoration(color: accent, borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))))),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text(label.toUpperCase(), style: AppTypography.labelTechnical.copyWith(color: AppColors.outline, fontSize: 9), maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 6),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: value,
                  style: AppTypography.headlineXl.copyWith(color: accent == AppColors.secondary ? AppColors.secondary : AppColors.primary, fontWeight: FontWeight.w800, fontSize: 26),
                  children: suffix.isNotEmpty ? [TextSpan(text: ' $suffix', style: AppTypography.headlineMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 14))] : [],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(description, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11, height: 1.2), maxLines: 2, overflow: TextOverflow.ellipsis),
          ]),
        ),
      ]),
    );
  }
}
