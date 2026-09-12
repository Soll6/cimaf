import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

class ActualitesPage extends StatelessWidget {
  const ActualitesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 28),
          color: AppColors.surfaceContainerLow,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('ACTUALITÉS & PRESSE', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary)),
                const SizedBox(height: 8),
                Text('L\'actualité industrielle CIMAF Gabon', style: AppTypography.headlineLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                Wrap(spacing: 8, children: [ _Chip('Tous', true), _Chip('Industrie', false), _Chip('RSE', false), _Chip('Carrières', false), _Chip('Certifications', false)]),
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: GridView.count(
                crossAxisCount: isMobile ? 1 : 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile ? 1.5 : 1.05,
                children: [
                  _NewsCard(date: '11 SEPT 2026', cat: 'CERTIFICATION', title: 'CEM III bas-carbone certifié -38% CO₂', excerpt: 'Le LNE Gabon valide la nouvelle formulation laitier 62% : 270 J/g, -38% vs CEM I.', image: 'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=600', featured: true),
                  _NewsCard(date: '28 AOÛT 2026', cat: 'LOGISTIQUE', title: 'Dépôt Franceville : 3 000 T opérationnelles', excerpt: 'Hub Haut-Ogooué pour chantiers miniers et route Transgabonaise.', image: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=600'),
                  _NewsCard(date: '15 AOÛT 2026', cat: 'RSE', title: '35 écoles livrées à Owendo et Ntoum', excerpt: '12 labos sciences + 120 bourses : le programme Écoles & Vocations franchit un cap.', image: 'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=600'),
                  _NewsCard(date: '02 AOÛT 2026', cat: 'INDUSTRIE', title: 'Record production : 52 000 T en juillet', excerpt: 'Broyeur vertical à 96% de disponibilité, qualité NF maintenue.', image: 'https://images.unsplash.com/photo-1513828583688-c52646db42da?w=600'),
                  _NewsCard(date: '18 JUIL 2026', cat: 'PARTENARIAT', title: 'Convention État — 10 000 T pour logements sociaux', excerpt: 'CIMAF partenaire du programme 1 200 logements Cité Amissa.', image: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=600'),
                  _NewsCard(date: '05 JUIL 2026', cat: 'FORMATION', title: 'Université CIMAF : 42 apprentis diplômés', excerpt: '78% embauchés en CDI, 42% de femmes techniciennes.', image: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=600'),
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
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                child: Row(children: [
                  const Icon(Icons.mail_outline, color: Color(0xFFFFDBCA)),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Newsletter CIMAF Gabon', style: AppTypography.titleSm.copyWith(color: Colors.white, fontWeight: FontWeight.w800)), Text('Actualités chantiers, fiches techniques, offres d\'emploi — 1 email/mois.', style: AppTypography.bodySm.copyWith(color: const Color(0xFFE2E7FF), fontSize: 12))])),
                  const SizedBox(width: 12),
                  ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary), child: Text('S\'ABONNER', style: AppTypography.labelMd.copyWith(fontWeight: FontWeight.w800, color: AppColors.primary))),
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

class _Chip extends StatelessWidget {
  final String label;
  final bool selected;
  const _Chip(this.label, this.selected);
  @override
  Widget build(BuildContext context) => FilterChip(label: Text(label, style: AppTypography.labelMd.copyWith(color: selected ? Colors.white : AppColors.primary, fontWeight: FontWeight.w700)), selected: selected, onSelected: (_) {}, selectedColor: AppColors.primary, backgroundColor: Colors.white, side: const BorderSide(color: Color(0xFFE2E8F0)));
}

class _NewsCard extends StatelessWidget {
  final String date, cat, title, excerpt, image;
  final bool featured;
  const _NewsCard({required this.date, required this.cat, required this.title, required this.excerpt, required this.image, this.featured = false});
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: featured ? AppColors.secondary : const Color(0xFFE2E8F0), width: featured ? 1.5 : 1), boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 8)]),
        clipBehavior: Clip.antiAlias,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            CachedNetworkImage(imageUrl: image, height: 150, width: double.infinity, fit: BoxFit.cover, errorWidget: (_, __, ___) => Container(height: 150, color: AppColors.surfaceContainerHighest)),
            Positioned(top: 10, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: featured ? AppColors.secondary : Colors.white, borderRadius: BorderRadius.circular(4)), child: Text(cat, style: AppTypography.labelTechnical.copyWith(color: featured ? Colors.white : AppColors.primary, fontSize: 9)))),
          ]),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(date, style: AppTypography.labelTechnical.copyWith(color: AppColors.outline, fontSize: 10)),
              const SizedBox(height: 6),
              Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 14), maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 6),
              Text(excerpt, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              Row(children: [Text('Lire l\'article', style: AppTypography.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)), const SizedBox(width: 6), const Icon(Icons.arrow_forward, size: 14, color: AppColors.primary)]),
            ]),
          ),
        ]),
      );
}
