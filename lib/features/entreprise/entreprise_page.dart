import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/section_header.dart';

class EntreprisePage extends StatelessWidget {
  const EntreprisePage({super.key});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return SingleChildScrollView(
      child: Column(children: [
        _Header(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 40),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: Column(children: [
                SectionHeader(
                  eyebrow: 'Outil Industriel',
                  title: 'Une usine de classe mondiale à Owendo',
                  description: 'Broyeur vertical 120 T/h, 4 silos 3 000 T, ensachage 2400 sacs/h, laboratoire ISO 9001 en continu.',
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBqKVIZ-CDeLJTJIXAe5c4aivH3osbT_pKpE6cYm4CwJFyjebiHNjcb0-3-A5zR68SARGhdJhFGw0p6qiuEdPg4RJvFpRqU6klCwu93zlqHTKX-_9FwlI8AvSQ7_ETKV0dFuQPBLrKu4DsoGtjCPR2Al84QbXB7_dLk_1HDC9953sl9GviNEKZSPUs-2dtPKzGbeQPDQdrV1KX2ovyDITJTVL8BY71SP_OvSCnz1h3l9AagOyvEA3Nm',
                    height: 320,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => Container(height: 320, color: AppColors.surfaceContainerHighest),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(spacing: 12, runSpacing: 12, children: [
                  _KpiCard(icon: Icons.speed, value: '120 T/h', label: 'Broyeur vertical'),
                  _KpiCard(icon: Icons.inventory_2_outlined, value: '12 000 T', label: 'Stock silos'),
                  _KpiCard(icon: Icons.science_outlined, value: '24/7', label: 'Labo qualité'),
                  _KpiCard(icon: Icons.local_shipping_outlined, value: '80 camions/j', label: 'Expéditions'),
                ]),
                const SizedBox(height: 40),
                if (isMobile)
                  Column(children: [_Timeline(), const SizedBox(height: 24), _Governance()])
                else
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: _Timeline()), const SizedBox(width: 32), Expanded(child: _Governance())]),
                const SizedBox(height: 32),
                _ValuesGrid(),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('L\'ENTREPRISE', style: AppTypography.labelTechnical.copyWith(color: const Color(0xFFFFDBCA))),
              const SizedBox(height: 8),
              Text('Souveraineté industrielle et excellence opérationnelle', style: AppTypography.displayHero.copyWith(color: Colors.white, fontSize: 36, height: 1.1)),
              const SizedBox(height: 12),
              Text('De Casablanca à Owendo : 15 ans d\'intégration panafricaine au service du Gabon.', style: AppTypography.bodyLg.copyWith(color: const Color(0xFFE2E7FF))),
            ]),
          ),
        ),
      );
}

class _Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('HISTOIRE & JALONS', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary)),
        const SizedBox(height: 12),
        for (final e in [
          ('2015', 'Pose de la première pierre — Owendo', 'Création de CIMAF Gabon, filiale du groupe Ciments de l\'Afrique.'),
          ('2017', 'Mise en service industrielle', 'Démarrage broyeur vertical et première tonne certifiée NF.'),
          ('2020', 'Extension logistique', 'Ouvertures dépôts Franceville & Ntoum, flotte vrac dédiée.'),
          ('2025', 'Cap des 500 000 T', 'Production cumulée record, 35 écoles RSE livrées.'),
        ])
          _TimelineItem(year: e.$1, title: e.$2, desc: e.$3),
      ]);
}

class _TimelineItem extends StatelessWidget {
  final String year, title, desc;
  const _TimelineItem({required this.year, required this.title, required this.desc});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(4)), child: Text(year, style: AppTypography.labelTechnical.copyWith(color: Colors.white, fontSize: 11))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 14)), Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant))]))
        ]),
      );
}

class _Governance extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('GOUVERNANCE & CERTIFICATIONS', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
          child: Column(children: [
            _GovRow(icon: Icons.verified, title: 'ISO 9001:2015', subtitle: 'Système qualité — Bureau Veritas', color: AppColors.primary),
            const Divider(),
            _GovRow(icon: Icons.eco, title: 'ISO 14001', subtitle: 'Management environnemental', color: AppColors.success),
            const Divider(),
            _GovRow(icon: Icons.health_and_safety, title: 'ISO 45001', subtitle: 'Santé & sécurité au travail', color: AppColors.secondary),
            const Divider(),
            _GovRow(icon: Icons.workspace_premium, title: 'Marque NF EN 197-1', subtitle: 'Ciments certifiés LNE Gabon', color: AppColors.primary),
          ]),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(8)),
          child: Row(children: [
            const Icon(Icons.groups_outlined, color: AppColors.primary),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Effectif 100% gabonais', style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 14)), Text('185 collaborateurs directs • 600 emplois indirects • 42% de femmes cadres', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12))])),
          ]),
        ),
      ]);
}

class _GovRow extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color color;
  const _GovRow({required this.icon, required this.title, required this.subtitle, required this.color});
  @override
  Widget build(BuildContext context) => Row(children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(6)), child: Icon(icon, size: 18, color: color)), const SizedBox(width: 12), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 14)), Text(subtitle, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12))])]);
}

class _KpiCard extends StatelessWidget {
  final IconData icon;
  final String value, label;
  const _KpiCard({required this.icon, required this.value, required this.label});
  @override
  Widget build(BuildContext context) => Container(
        width: 160,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(children: [Icon(icon, color: AppColors.primary), const SizedBox(height: 6), Text(value, style: AppTypography.headlineSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)), Text(label, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11), textAlign: TextAlign.center)]),
      );
}

class _ValuesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.6,
        children: [
          _ValueCard(icon: Icons.handshake_outlined, title: 'Partenariat État', desc: 'Aligné Plan Stratégique Gabon Émergent 2025-2040.'),
          _ValueCard(icon: Icons.bolt_outlined, title: 'Efficacité Énergétique', desc: 'Broyeur vertical -30% kWh/T vs ball mill.'),
          _ValueCard(icon: Icons.school_outlined, title: 'Transfert de Compétences', desc: 'Université CIMAF : 120 apprentis/an formés en usine.'),
        ],
      );
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title, desc;
  const _ValueCard({required this.icon, required this.title, required this.desc});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(8)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: AppColors.secondary), const SizedBox(height: 8), Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800)), Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant))]),
      );
}
