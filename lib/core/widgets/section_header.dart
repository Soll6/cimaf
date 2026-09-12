import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String? description;
  final Widget? action;
  final Color eyebrowColor;
  final CrossAxisAlignment align;
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.description,
    this.action,
    this.eyebrowColor = AppColors.secondary,
    this.align = CrossAxisAlignment.start,
  });
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final header = Column(crossAxisAlignment: align, children: [
      Text(eyebrow.toUpperCase(), style: AppTypography.labelTechnical.copyWith(color: eyebrowColor, letterSpacing: 1.2)),
      const SizedBox(height: 8),
      Text(title, style: (isMobile ? AppTypography.headlineLgMobile : AppTypography.headlineLg).copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
      if (description != null) ...[
        const SizedBox(height: 8),
        Text(description!, style: AppTypography.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
      ],
    ]);
    if (action == null) return header;
    if (isMobile) return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [header, const SizedBox(height: 16), action!]);
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [Expanded(child: header), const SizedBox(width: 24), action!]);
  }
}
