import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class ProductCard extends StatelessWidget {
  final String badge;
  final Color badgeColor;
  final Color badgeTextColor;
  final String norm;
  final String title;
  final String subtitle;
  final String resistance;
  final double resistanceRatio;
  final String secondaryLabel;
  final String secondaryValue;
  final List<String> bullets;
  final String primaryCta;
  final VoidCallback onPrimary;
  final String? accentTop;

  const ProductCard({
    super.key,
    required this.badge,
    required this.badgeColor,
    required this.badgeTextColor,
    required this.norm,
    required this.title,
    required this.subtitle,
    required this.resistance,
    required this.resistanceRatio,
    required this.secondaryLabel,
    required this.secondaryValue,
    required this.bullets,
    required this.primaryCta,
    required this.onPrimary,
    this.accentTop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x140F172A), blurRadius: 12, offset: Offset(0, 4))],
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(children: [
        if (accentTop != null) Container(height: 4, color: AppColors.secondary),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(4)),
                  child: Text(badge.toUpperCase(), style: AppTypography.labelTechnical.copyWith(color: badgeTextColor, fontSize: 10), maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
              ),
              const SizedBox(width: 8),
              Text(norm, style: AppTypography.labelTechnical.copyWith(color: AppColors.outline)),
            ]),
            const SizedBox(height: 16),
            Text(title, style: AppTypography.headlineMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(subtitle, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(8)),
              child: Column(children: [
                Row(children: [
                  Expanded(child: Text('Résistance à 28 jours :', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant))),
                  Text(resistance, style: AppTypography.bodySm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
                ]),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(value: resistanceRatio, minHeight: 8, backgroundColor: const Color(0xFFDAE2FD), color: badgeColor == AppColors.secondaryFixed ? AppColors.secondary : AppColors.primary),
                ),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(child: Text(secondaryLabel, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant), overflow: TextOverflow.ellipsis)),
                  const SizedBox(width: 8),
                  Text(secondaryValue, style: AppTypography.bodySm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
                ]),
              ]),
            ),
            const SizedBox(height: 14),
            for (final b in bullets)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Icon(Icons.check_circle, size: 16, color: AppColors.secondary),
                  const SizedBox(width: 8),
                  Expanded(child: Text(b, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant))),
                ]),
              ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPrimary,
                style: ElevatedButton.styleFrom(backgroundColor: badgeColor == AppColors.secondaryFixed ? AppColors.secondary : AppColors.primaryContainer, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                child: Text(primaryCta.toUpperCase(), style: AppTypography.labelMd.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Téléchargement fiche technique (bientôt)'))),
                icon: const Icon(Icons.description_outlined, size: 16),
                label: Text('FICHE TECHNIQUE PDF', style: AppTypography.labelTechnical.copyWith(color: AppColors.primary)),
                style: OutlinedButton.styleFrom(backgroundColor: AppColors.surfaceContainerLow, side: BorderSide.none, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
