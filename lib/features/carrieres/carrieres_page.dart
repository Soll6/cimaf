import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

class CarrieresPage extends StatelessWidget {
  const CarrieresPage({super.key});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 32),
          color: AppColors.surfaceContainerLow,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('CARRIÈRES', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary)),
                const SizedBox(height: 8),
                Text('Construisez votre avenir avec l\'industriel de référence', style: AppTypography.headlineLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                Text('185 collaborateurs, 42% de femmes cadres, 120 apprentis/an. Formation continue, sécurité ISO 45001, mobilité panafricaine.', style: AppTypography.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
                const SizedBox(height: 16),
                Wrap(spacing: 12, children: [
                  ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.work_outline, size: 16), label: const Text('VOIR LES OFFRES (8)')),
                  OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.upload_file_outlined, size: 16), label: const Text('CANDIDATURE SPONTANÉE')),
                ]),
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: Column(children: [
                GridView.count(
                  crossAxisCount: isMobile ? 1 : 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isMobile ? 2.2 : 2.8,
                  children: [
                    _JobCard(title: 'Technicien Laboratoire Qualité H/F', location: 'Owendo • CDI', tags: const ['ISO 9001', '24/7', 'Chimie'], highlight: true),
                    _JobCard(title: 'Conducteur Broyeur Vertical H/F', location: 'Owendo • CDI', tags: const ['120 T/h', 'Automatisme', 'HSE']),
                    _JobCard(title: 'Responsable Logistique Vrac H/F', location: 'Owendo / Franceville • CDI', tags: const ['80 camions/j', 'SAP', 'Supply']),
                    _JobCard(title: 'Apprenti Maintenance Électromécanique', location: 'Owendo • Alternance 12 mois', tags: const ['Bac+2', 'Compagnonnage', 'Bourse']),
                    _JobCard(title: 'Commercial BTP — Région Estuaire', location: 'Libreville • CDI', tags: const ['CPJ 35/45', 'Réseau négoce', 'Prime']),
                    _JobCard(title: 'Chargé RSE & Écoles H/F', location: 'Owendo • CDI', tags: const ['RSE', 'Écoles', '35 établissements']),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                  child: Row(children: [
                    const Icon(Icons.school_outlined, color: Color(0xFFFFDBCA)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Université CIMAF — 120 apprentis/an', style: AppTypography.titleSm.copyWith(color: Colors.white, fontWeight: FontWeight.w800)), Text('Formation rémunérée 6-12 mois en usine, certificat CIMAF + insertion 78% en CDI.', style: AppTypography.bodySm.copyWith(color: const Color(0xFFE2E7FF)))])),
                    const SizedBox(width: 12),
                    ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary), child: Text('POSTULER', style: AppTypography.labelMd.copyWith(color: Colors.white, fontWeight: FontWeight.w800))),
                  ]),
                ),
              ]),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}

class _JobCard extends StatelessWidget {
  final String title, location;
  final List<String> tags;
  final bool highlight;
  const _JobCard({required this.title, required this.location, required this.tags, this.highlight = false});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: highlight ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: highlight ? AppColors.primary : const Color(0xFFE2E8F0)),
          boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 8)],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(child: Text(title, style: AppTypography.titleSm.copyWith(color: highlight ? Colors.white : AppColors.onSurface, fontWeight: FontWeight.w800, fontSize: 14))),
            if (highlight) Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(4)), child: Text('NOUVEAU', style: AppTypography.labelTechnical.copyWith(color: Colors.white, fontSize: 9))),
          ]),
          const SizedBox(height: 6),
          Row(children: [Icon(Icons.location_on_outlined, size: 14, color: highlight ? const Color(0xFFE2E7FF) : AppColors.outline), const SizedBox(width: 4), Text(location, style: AppTypography.bodySm.copyWith(color: highlight ? const Color(0xFFE2E7FF) : AppColors.onSurfaceVariant, fontSize: 12))]),
          const SizedBox(height: 10),
          Wrap(spacing: 6, children: [for (final t in tags) Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: highlight ? Colors.white.withOpacity(0.15) : AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(4)), child: Text(t, style: AppTypography.labelTechnical.copyWith(color: highlight ? Colors.white : AppColors.primary, fontSize: 10)))]),
          const SizedBox(height: 10),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: highlight ? Colors.white : AppColors.primary, foregroundColor: highlight ? AppColors.primary : Colors.white, padding: const EdgeInsets.symmetric(vertical: 10), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))), child: Text('Postuler', style: AppTypography.labelMd.copyWith(fontWeight: FontWeight.w800, color: highlight ? AppColors.primary : Colors.white)))),
        ]),
      );
}
