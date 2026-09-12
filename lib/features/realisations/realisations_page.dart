import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

class RealisationsPage extends StatelessWidget {
  const RealisationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 32),
          color: AppColors.primary,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('RÉALISATIONS', style: AppTypography.labelTechnical.copyWith(color: const Color(0xFFFFDBCA))),
                const SizedBox(height: 8),
                Text('Les ouvrages qui façonnent le Gabon moderne', style: AppTypography.headlineLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
                Text('Énergie, transport, habitat : plus de 120 chantiers majeurs depuis 2017.', style: AppTypography.bodyLg.copyWith(color: const Color(0xFFE2E7FF))),
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
                crossAxisCount: isMobile ? 1 : 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile ? 1.1 : 1.35,
                children: [
                  _ProjectTile(title: 'Barrage de Kinguélé Aval — 35 MW', category: 'ÉNERGIE • CEM III/A LH', desc: '4 800 m³ béton de masse sans fissuration thermique. Maître d\'ouvrage : FGIS / Asonha Energy.', image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBc2OzLfVikweietsepYiYLi5xoIUCa1QCLSxFUJ10rvE-v6U4ZAWfJu71huFAsFiTZzfSiWV5ifA6mWWjmuiCHxpehot_chgZYZvqQz85MxZc4H201x2oM5AQxP_ngo2mJ24fNgcrTyVM-klZpcVinlgaJKI7IhUYgLWQ2yJJjRDSiSJvL8azsfEyY-odEkC-b74a38VzLSEWaaBSeDPFPvjIiLRzHswuF1KmHDFj_j0tMFqHJ0pzJ'),
                  _ProjectTile(title: 'Transgabonaise — PK 0 à 120', category: 'INFRA ROUTIÈRE • CEM II/B-M 42.5', desc: 'Reconstruction chaussée lourde, 22 000 T de ciment, partenariat Sogea-Satom.', image: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800'),
                  _ProjectTile(title: 'Port d\'Owendo — Extension quai', category: 'MARITIME • CEM III/A LH', desc: 'Blocs béton immergés, résistance eau sulfatée, 6 000 m³.', image: 'https://images.unsplash.com/photo-1494412651409-8963ce7935b4?w=800'),
                  _ProjectTile(title: 'Cité Administrative Libreville', category: 'BÂTIMENT • CEM II/B-M 42.5', desc: 'R+15 structure BA, décoffrage 18h, 9 000 T.', image: 'https://images.unsplash.com/photo-1460574283810-2aab119d8511?w=800'),
                  _ProjectTile(title: 'Lycée Technique Owendo', category: 'RSE • CPJ 35 & 45', desc: '3 bâtiments R+2, enduits & structures, livré 2025.', image: 'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=800'),
                  _ProjectTile(title: 'Lotissement Cité Amissa — 1 200 logements', category: 'HABITAT • CPJ 35', desc: 'Programme social, maçonnerie et dallages, 14 000 T.', image: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800'),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _ProjectTile extends StatelessWidget {
  final String title, category, desc, image;
  const _ProjectTile({required this.title, required this.category, required this.desc, required this.image});
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12)], border: Border.all(color: const Color(0xFFE2E8F0))),
        clipBehavior: Clip.antiAlias,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CachedNetworkImage(imageUrl: image, height: 180, width: double.infinity, fit: BoxFit.cover, errorWidget: (_, __, ___) => Container(height: 180, color: AppColors.surfaceContainerHighest)),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(category, style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary, fontSize: 10)),
              const SizedBox(height: 6),
              Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 15)),
              const SizedBox(height: 6),
              Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12)),
              const SizedBox(height: 10),
              Row(children: [Text('Voir fiche projet', style: AppTypography.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)), const SizedBox(width: 6), const Icon(Icons.arrow_forward, size: 14, color: AppColors.primary)]),
            ]),
          ),
        ]),
      );
}
