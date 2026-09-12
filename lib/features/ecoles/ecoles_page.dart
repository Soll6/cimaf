import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

class EcolesPage extends StatelessWidget {
  const EcolesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 32),
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, Color(0xFF783200)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: isMobile
                  ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: _header())
                  : Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: _header())), const SizedBox(width: 24), Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(12), child: CachedNetworkImage(imageUrl: 'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=800', height: 280, fit: BoxFit.cover, errorWidget: (_, __, ___) => Container(height: 280, color: Colors.white24))))]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: Column(children: [
                GridView.count(
                  crossAxisCount: isMobile ? 1 : 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isMobile ? 1.9 : 1.35,
                  children: [
                    _PgmCard(icon: Icons.backpack_outlined, title: 'Écoles Réhabilitées', desc: '35 établissements : 22 primaires, 8 collèges, 5 lycées techniques. Sanitaires, électricité, mobilier.', metric: '35', metricLabel: 'ÉCOLES'),
                    _PgmCard(icon: Icons.science_outlined, title: 'Labos Sciences', desc: '12 laboratoires équipés (microscopes, paillasses), formation enseignants.', metric: '12', metricLabel: 'LABOS'),
                    _PgmCard(icon: Icons.workspace_premium_outlined, title: 'Bourses & Mérite', desc: '120 bourses/an : 60 scientifiques, 40 techniques, 20 excellence filles.', metric: '120', metricLabel: '/AN'),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(8)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('PARCOURS VOCATIONS INDUSTRIELLES', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary)),
                    const SizedBox(height: 12),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: isMobile ? 3.5 : 2.2,
                      children: [
                        _Step(num: '1', title: 'Découverte 4e/3e', desc: 'Visite usine + atelier béton 1 jour'),
                        _Step(num: '2', title: 'Compagnonnage', desc: 'Stage 2 semaines en production encadré'),
                        _Step(num: '3', title: 'Apprentissage', desc: '12 mois rémunérés, certificat CIMAF'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary), icon: const Icon(Icons.edit_outlined, size: 16), label: Text('INSCRIRE MON ÉTABLISSEMENT', style: AppTypography.labelLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800)))),
                  ]),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
                  child: Row(children: [
                    const Icon(Icons.format_quote, color: AppColors.secondary, size: 28),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('"Grâce à CIMAF j\'ai découvert le métier de laborantin. Aujourd\'hui je contrôle la qualité du ciment qui construit mon quartier."', style: AppTypography.bodyLg.copyWith(color: AppColors.onSurface, fontStyle: FontStyle.italic, fontSize: 15)), const SizedBox(height: 6), Text('— Aïssatou, 19 ans, apprentie laboratoire Owendo, promo 2024', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant))])),
                  ]),
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }

  List<Widget> _header() => [
        Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(4)), child: Text('PROGRAMME PHARE RSE — DEPUIS 2019', style: AppTypography.labelTechnical.copyWith(color: Colors.white, fontSize: 10))),
        const SizedBox(height: 12),
        Text('Écoles & Vocations :\nformer la relève industrielle du Gabon', style: AppTypography.headlineLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 28, height: 1.1)),
        const SizedBox(height: 12),
        Text('Le ciment le plus durable est celui qui élève les compétences. 35 écoles, 12 labos, 4 200 élèves impactés.', style: AppTypography.bodyLg.copyWith(color: const Color(0xFFFFDBCA))),
        const SizedBox(height: 16),
        Wrap(spacing: 8, children: [
          ElevatedButton.icon(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary), icon: const Icon(Icons.school_outlined, size: 16), label: Text('DEVENIR ÉCOLE PARTENAIRE', style: AppTypography.labelMd.copyWith(fontWeight: FontWeight.w800, color: AppColors.primary))),
          OutlinedButton.icon(onPressed: () {}, style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white54)), icon: const Icon(Icons.play_circle_outline, size: 16, color: Colors.white), label: Text('VOIR LE FILM (2 min)', style: AppTypography.labelMd.copyWith(color: Colors.white, fontWeight: FontWeight.w700))),
        ]),
      ];
}

class _PgmCard extends StatelessWidget {
  final IconData icon;
  final String title, desc, metric, metricLabel;
  const _PgmCard({required this.icon, required this.title, required this.desc, required this.metric, required this.metricLabel});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.secondaryFixed, borderRadius: BorderRadius.circular(6)), child: Icon(icon, color: AppColors.secondary, size: 18)), const Spacer(), Text(metric, style: AppTypography.headlineLg.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w800)), const SizedBox(width: 4), Text(metricLabel, style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary, fontSize: 10))]),
          const SizedBox(height: 10),
          Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12)),
        ]),
      );
}

class _Step extends StatelessWidget {
  final String num, title, desc;
  const _Step({required this.num, required this.title, required this.desc});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Row(children: [Container(width: 36, height: 36, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(18)), child: Center(child: Text(num, style: AppTypography.titleSm.copyWith(color: Colors.white, fontWeight: FontWeight.w800)))), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 13)), Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11))]))]),
      );
}
