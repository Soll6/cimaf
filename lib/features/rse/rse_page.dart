import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

class RsePage extends StatelessWidget {
  const RsePage({super.key});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 36),
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColors.primary, Color(0xFF0F172A)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: isMobile
                  ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: _rseHeader())
                  : Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: _rseHeader())), const SizedBox(width: 24), Expanded(child: _RseHeroStats())]),
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
                  childAspectRatio: isMobile ? 1.8 : 1.15,
                  children: [
                    _RseCard(icon: Icons.school_outlined, title: 'Écoles & Vocations', desc: '35 écoles rénovées, 4 200 élèves, 12 labos sciences équipés. Programme 2024-2027.', accent: AppColors.secondary),
                    _RseCard(icon: Icons.eco_outlined, title: 'Décarbonation', desc: '-38% CO₂/T grâce au laitier, 62% de substitution clinker, 100% palettes recyclées.', accent: AppColors.success),
                    _RseCard(icon: Icons.diversity_3_outlined, title: 'Emploi Jeunes', desc: '120 bourses/an, 42% femmes techniciennes, compagnonnage 6 mois en usine.', accent: AppColors.primary),
                  ],
                ),
                const SizedBox(height: 24),
                if (isMobile) _RseHeroStats(),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(8), border: const Border(left: BorderSide(color: AppColors.secondary, width: 4))),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('ENGAGEMENT TERRITORIAL', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary)),
                    const SizedBox(height: 8),
                    Text('« À Owendo nous ne produisons pas seulement du ciment, nous produisons des compétences. »', style: AppTypography.headlineSm.copyWith(color: AppColors.primary, fontStyle: FontStyle.italic)),
                    const SizedBox(height: 8),
                    Text('— Direction Générale CIMAF Gabon, Rapport RSE 2025', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                  ]),
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }

  List<Widget> _rseHeader() => [
        Text('RSE & ENGAGEMENT', style: AppTypography.labelTechnical.copyWith(color: const Color(0xFFFFDBCA))),
        const SizedBox(height: 8),
        Text('Bâtir des infrastructures,\nrévéler des vocations', style: AppTypography.headlineLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 28)),
        const SizedBox(height: 12),
        Text('Notre responsabilité : un ancrage durable à Owendo, des écoles aux ateliers, du laboratoire aux chantiers.', style: AppTypography.bodyMd.copyWith(color: const Color(0xFFE2E7FF))),
      ];
}

class _RseHeroStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white24)),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _M('35+', 'ÉCOLES', AppColors.secondaryFixed),
            _M('4 200', 'ÉLÈVES', Colors.white),
            _M('120', 'BOURSES/AN', const Color(0xFFFFDBCA)),
          ]),
          const Divider(color: Colors.white24, height: 24),
          Row(children: [
            const Icon(Icons.verified_outlined, size: 16, color: Color(0xFFFFDBCA)),
            const SizedBox(width: 8),
            Expanded(child: Text('Certifié RSE ISO 26000 — Audit 2025 : 4.6/5', style: AppTypography.bodySm.copyWith(color: Colors.white))),
          ]),
        ]),
      );
  Widget _M(String v, String l, Color c) => Column(children: [Text(v, style: AppTypography.headlineLg.copyWith(color: c, fontWeight: FontWeight.w800, fontSize: 28)), Text(l, style: AppTypography.labelTechnical.copyWith(color: Colors.white, fontSize: 10))]);
}

class _RseCard extends StatelessWidget {
  final IconData icon;
  final String title, desc;
  final Color accent;
  const _RseCard({required this.icon, required this.title, required this.desc, required this.accent});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0)), boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 8)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: accent.withOpacity(0.12), borderRadius: BorderRadius.circular(6)), child: Icon(icon, color: accent)),
          const SizedBox(height: 10),
          Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12)),
          const SizedBox(height: 10),
          Text('En savoir plus →', style: AppTypography.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
        ]),
      );
}
