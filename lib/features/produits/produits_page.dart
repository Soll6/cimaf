import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/product_card.dart';

class ProduitsPage extends StatelessWidget {
  final void Function(String) onNavigate;
  const ProduitsPage({super.key, required this.onNavigate});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          color: AppColors.surfaceContainerLow,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('NOS PRODUITS', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary)),
                const SizedBox(height: 8),
                Text('Ciments certifiés pour chaque exigence chantier', style: (isMobile ? AppTypography.headlineLgMobile : AppTypography.headlineLg).copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                Text('Climat équatorial, agressions marines, hautes résistances : CIMAF formule la réponse technique adaptée, du sac 50kg au vrac citerne.', style: AppTypography.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
                const SizedBox(height: 16),
                Wrap(spacing: 8, children: [
                  _FilterChip(label: 'Tous', selected: true),
                  _FilterChip(label: 'CPJ 35'),
                  _FilterChip(label: 'CPJ 45'),
                  _FilterChip(label: 'LH Basse Chaleur'),
                  _FilterChip(label: 'Vrac'),
                ]),
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: GridView.count(
                crossAxisCount: isMobile ? 1 : 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile ? 0.92 : 0.78,
                children: [
                  ProductCard(badge: 'Ouvrages Spéciaux', badgeColor: AppColors.primary, badgeTextColor: Colors.white, norm: 'EN 197-1', title: 'CEM III/A 42.5 N LH', subtitle: 'Laitier 36-65% — Faible chaleur', resistance: '≥ 42.5 MPa', resistanceRatio: 0.85, secondaryLabel: 'Agression marine', secondaryValue: 'Très Élevée', bullets: const ['Barrages, fondations profondes, ouvrages maritimes', 'Chaleur d\'hydratation < 270 J/g', 'Vrac & Big Bag 1.5T'], primaryCta: 'Demander cotation vrac', onPrimary: () => onNavigate('devis')),
                  ProductCard(badge: 'Gros Œuvre', badgeColor: AppColors.secondaryFixed, badgeTextColor: AppColors.onSecondaryFixed, norm: 'CPJ 45', title: 'CEM II/B-M 42,5 N', subtitle: 'Calcaire + Pouzzolane — Polyvalent', resistance: '≥ 42.5 MPa', resistanceRatio: 0.80, secondaryLabel: 'Pompabilité', secondaryValue: 'Optimale', bullets: const ['Poteaux, poutres, dalles, radiers', 'Décoffrage rapide 24h', 'Sacs 50kg & vrac'], primaryCta: 'Demander cotation BTP', onPrimary: () => onNavigate('devis'), accentTop: 'x'),
                  ProductCard(badge: 'Bâtiment Courant', badgeColor: AppColors.surfaceContainerHigh, badgeTextColor: AppColors.primary, norm: 'CPJ 35', title: 'CEM II/B-M 32,5 N', subtitle: 'Maçonnerie & finitions', resistance: '≥ 32.5 MPa', resistanceRatio: 0.65, secondaryLabel: 'Plasticité', secondaryValue: 'Excellente', bullets: const ['Enduits, chapes, dallages maison', 'Faible fissuration', 'Sac kraft 50kg'], primaryCta: 'Trouver distributeur', onPrimary: () => onNavigate('contact')),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('TABLEAU COMPARATIF TECHNIQUE', style: AppTypography.labelTechnical.copyWith(color: AppColors.primary)),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(AppColors.surfaceContainerLow),
                      columns: [
                        DataColumn(label: Text('Produit', style: AppTypography.labelMd.copyWith(fontWeight: FontWeight.w800))),
                        DataColumn(label: Text('Résistance', style: AppTypography.labelMd.copyWith(fontWeight: FontWeight.w800))),
                        DataColumn(label: Text('Usage', style: AppTypography.labelMd.copyWith(fontWeight: FontWeight.w800))),
                        DataColumn(label: Text('Conditionnement', style: AppTypography.labelMd.copyWith(fontWeight: FontWeight.w800))),
                      ],
                      rows: [
                        DataRow(cells: [DataCell(Text('CEM III/A 42.5 LH', style: AppTypography.bodySm.copyWith(fontWeight: FontWeight.w700))), DataCell(Text('≥42.5 MPa')), DataCell(Text('Barrages, marine')), DataCell(Text('Vrac, Big Bag'))]),
                        DataRow(cells: [DataCell(Text('CEM II/B-M 42.5 N', style: AppTypography.bodySm.copyWith(fontWeight: FontWeight.w700))), DataCell(Text('≥42.5 MPa')), DataCell(Text('Structure BA')), DataCell(Text('50kg, Vrac'))]),
                        DataRow(cells: [DataCell(Text('CEM II/B-M 32.5 N', style: AppTypography.bodySm.copyWith(fontWeight: FontWeight.w700))), DataCell(Text('≥32.5 MPa')), DataCell(Text('Maçonnerie')), DataCell(Text('50kg'))]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(spacing: 12, children: [
                    ElevatedButton.icon(onPressed: () => onNavigate('devis'), icon: const Icon(Icons.request_quote_outlined, size: 16), label: const Text('DEMANDE DE DEVIS')),
                    OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.download_outlined, size: 16), label: const Text('GUIDE TECHNIQUE PDF')),
                    TextButton.icon(onPressed: () => onNavigate('contact'), icon: const Icon(Icons.store_outlined, size: 16), label: const Text('RÉSEAU DISTRIBUTEURS')),
                  ]),
                ]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ]),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _FilterChip({required this.label, this.selected = false});
  @override
  Widget build(BuildContext context) => FilterChip(
        label: Text(label, style: AppTypography.labelMd.copyWith(color: selected ? Colors.white : AppColors.primary, fontWeight: FontWeight.w700)),
        selected: selected,
        onSelected: (_) {},
        selectedColor: AppColors.primary,
        backgroundColor: Colors.white,
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      );
}
