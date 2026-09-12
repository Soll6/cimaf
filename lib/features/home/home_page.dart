import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/stat_card.dart';
import '../../core/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  final void Function(String) onNavigate;
  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        _Hero(onNavigate: onNavigate),
        _StatsBand(),
        _VisionSection(onNavigate: onNavigate),
        _ProductsSection(onNavigate: onNavigate),
        _ProjectsSection(onNavigate: onNavigate),
        _RseBanner(onNavigate: onNavigate),
        _NewsPreview(onNavigate: onNavigate),
        const SizedBox(height: 40),
      ]),
    );
  }
}

class _Hero extends StatelessWidget {
  final void Function(String) onNavigate;
  const _Hero({required this.onNavigate});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      child: Stack(children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.15,
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [Colors.white, Colors.transparent], center: Alignment.topRight, radius: 1.5),
              ),
            ),
          ),
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: isMobile ? 32 : 48),
              child: isMobile ? _heroContent(context, isMobile) : Row(crossAxisAlignment: CrossAxisAlignment.center, children: [Expanded(child: _heroContent(context, isMobile)), const SizedBox(width: 32), Expanded(child: _HeroVisual())]),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _heroContent(BuildContext context, bool isMobile) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), borderRadius: BorderRadius.circular(4)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Text('ANCRAGE TERRITORIAL & SOUVERAINETÉ INDUSTRIELLE', style: AppTypography.labelTechnical.copyWith(color: const Color(0xFFFFDBCA), fontSize: 10)),
        ]),
      ),
      const SizedBox(height: 16),
      Text('Bâtir l\'avenir du Gabon avec rigueur et fierté.', style: (isMobile ? AppTypography.headlineXlMobile : AppTypography.displayHero).copyWith(color: Colors.white, fontWeight: FontWeight.w800, height: 1.05)),
      const SizedBox(height: 14),
      Text('Opérateur cimentier de référence depuis 2015, CIMAF Gabon garantit une production nationale aux normes internationales les plus exigeantes. Depuis notre usine ultramoderne d\'Owendo, nous sécurisons l\'indépendance constructive de la Nation et formons la relève technique gabonaise.',
          style: AppTypography.bodyLg.copyWith(color: const Color(0xFFE2E7FF))),
      const SizedBox(height: 20),
      Wrap(spacing: 12, runSpacing: 12, children: [
        ElevatedButton.icon(
          onPressed: () => onNavigate('produits'),
          icon: const Icon(Icons.layers_outlined, size: 18),
          label: Text('NOS SOLUTIONS CIMENTS', style: AppTypography.labelLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14)),
        ),
        OutlinedButton.icon(
          onPressed: () => onNavigate('ecoles'),
          icon: const Icon(Icons.backpack_outlined, size: 18, color: Color(0xFFFFDBCA)),
          label: Text('ÉCOLES & VOCATIONS', style: AppTypography.labelLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
          style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0x33FFFFFF)), foregroundColor: Colors.white, backgroundColor: Colors.white.withOpacity(0.08)),
        ),
      ]),
      const SizedBox(height: 18),
      Wrap(spacing: 16, children: [
        _TrustChip(icon: Icons.verified_outlined, label: 'Ciments certifiés NF EN 197-1'),
        _TrustChip(icon: Icons.precision_manufacturing_outlined, label: 'Broyeurs verticaux haute efficacité'),
      ]),
      if (isMobile) ...[const SizedBox(height: 24), const _HeroVisual()],
    ]);
  }
}

class _TrustChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _TrustChip({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 16, color: const Color(0xFFFFDBCA)), const SizedBox(width: 6), Text(label, style: AppTypography.labelMd.copyWith(color: const Color(0xFFE2E7FF)))]);
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual();
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 420,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: const [BoxShadow(color: Color(0x40000000), blurRadius: 24, offset: Offset(0, 12))]),
        clipBehavior: Clip.antiAlias,
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBqKVIZ-CDeLJTJIXAe5c4aivH3osbT_pKpE6cYm4CwJFyjebiHNjcb0-3-A5zR68SARGhdJhFGw0p6qiuEdPg4RJvFpRqU6klCwu93zlqHTKX-_9FwlI8AvSQ7_ETKV0dFuQPBLrKu4DsoGtjCPR2Al84QbXB7_dLk_1HDC9953sl9GviNEKZSPUs-2dtPKzGbeQPDQdrV1KX2ovyDITJTVL8BY71SP_OvSCnz1h3l9AagOyvEA3Nm',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 420,
            placeholder: (_, __) => Container(color: AppColors.surfaceContainerHighest),
            errorWidget: (_, __, ___) => Container(color: AppColors.primary, child: const Icon(Icons.factory, size: 64, color: Colors.white)),
          ),
          Positioned.fill(child: Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Color(0xCC003F76)])))),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: const [BoxShadow(color: Color(0x30000000), blurRadius: 12)]),
              child: Row(children: [
                Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.secondaryContainer, borderRadius: BorderRadius.circular(4)), child: const Icon(Icons.military_tech_outlined, color: AppColors.onSecondary)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('10 Ans d\'Excellence', style: AppTypography.headlineSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800, fontSize: 16)),
                    Text('Partenaire stratégique des grands ouvrages gabonais', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ]),
                ),
              ]),
            ),
          ),
        ]),
      ),
      Positioned(left: 12, right: -12, top: 12, bottom: -12, child: Container(decoration: BoxDecoration(color: const Color(0x40F16E10), borderRadius: BorderRadius.circular(12)))),
    ]);
  }
}

class _StatsBand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Transform.translate(
      offset: const Offset(0, -12),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 48),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12)]),
              child: GridView.count(
                crossAxisCount: isMobile ? 2 : 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: isMobile ? 1.3 : 1.5,
                children: const [
                  StatCard(label: 'Capacité Annuelle', value: '500 000+', suffix: 'T', description: 'Volume broyé et conditionné à l\'usine d\'Owendo', accent: AppColors.secondary),
                  StatCard(label: 'Ancrage Local', value: '100%', description: 'Emplois directs & indirects gabonais pérennisés', accent: AppColors.primary),
                  StatCard(label: 'Pérennité Industrielle', value: '2015', description: 'Implantation fondatrice au cœur de l\'Estuaire', accent: AppColors.secondary),
                  StatCard(label: 'Impact Social RSE', value: '35+', suffix: 'Écoles', description: '4 200+ élèves formés aux vocations de l\'industrie', accent: AppColors.secondary),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VisionSection extends StatelessWidget {
  final void Function(String) onNavigate;
  const _VisionSection({required this.onNavigate});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
          child: isMobile
              ? Column(children: [_VisionVisual(), const SizedBox(height: 24), _VisionText(onNavigate: onNavigate)])
              : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: _VisionVisual()), const SizedBox(width: 32), Expanded(child: _VisionText(onNavigate: onNavigate))]),
        ),
      ),
    );
  }
}

class _VisionVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(children: [
            CachedNetworkImage(
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCNx84uysYkv2OZn4c_C1Erk0jFFkJ4DiglUmYHj4-_80DvoEdrENqhRNxrBMWC_Gjl375Yy7Be0k63_vpoqOvOhJOaigThiqpL1dZWQagq-FqxqUGotFLJQYG4p12VK8AMt99qDFvSxq2_yV02BLU4snv7f0Vr6W0QTfMiSP6bfwNDIDdbiBQO4sFScgoRDbHfRbO1WSV4SEwapdjaLM51XbEZlEHbET6q8pN1fEOzIKP_BMFww5GL',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(height: 300, color: AppColors.surfaceContainerHighest),
              errorWidget: (_, __, ___) => Container(height: 300, color: AppColors.surfaceContainer),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.9), borderRadius: BorderRadius.circular(4)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('CONTRÔLE QUALITÉ CONTINU', style: AppTypography.labelTechnical.copyWith(color: const Color(0xFFFFDBCA), fontSize: 10)),
                  Text('Laboratoire certifié ISO 9001:2015', style: AppTypography.titleSm.copyWith(color: Colors.white)),
                ]),
              ),
            ),
          ]),
        ),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(8)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Plateforme Owendo', style: AppTypography.titleSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
                Text('Hub logistique maritime & ferroviaire connecté au Transgabonais', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ]),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(8)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Relais Intérieurs', style: AppTypography.titleSm.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w800)),
                Text('Dépôts avancés à Franceville, Ntoum et distribution provinciale', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ]),
            ),
          ),
        ]),
      ]);
}

class _VisionText extends StatelessWidget {
  final void Function(String) onNavigate;
  const _VisionText({required this.onNavigate});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('VISION & MISSIONS NATIONALES', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary, letterSpacing: 1.2)),
        const SizedBox(height: 8),
        Text('CIMAF Gabon, acteur souverain du développement national', style: AppTypography.headlineLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        Text('Filiale du groupe panafricain CIMAF (Ciments de l\'Afrique), notre entité gabonaise incarne une réponse résolue aux défis de l\'urbanisation durable et de la construction d\'infrastructures lourdes. À travers un outil industriel de pointe et une maîtrise intégrée des formulations, nous fournissons le socle solide sur lequel s\'érige le Gabon moderne.',
            style: AppTypography.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.45,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _Pillar(icon: Icons.account_balance_outlined, title: 'Souveraineté Industrielle', desc: 'Sécurisation continue de l\'approvisionnement national sans dépendance d\'importation.'),
            _Pillar(icon: Icons.verified_user_outlined, title: 'Qualité Certifiée', desc: 'Formulations conformes aux normes gabonaises et européennes EN 197-1.'),
            _Pillar(icon: Icons.eco_outlined, title: 'Transition Bas-Carbone', desc: 'Valorisation d\'ajouts cimentaires minéraux et efficacité énergétique active.', orange: true),
            _Pillar(icon: Icons.diversity_3_outlined, title: 'Responsabilité Sociétale', desc: 'Transfert technologique, sécurité au travail et programmes éducatifs majeurs.', orange: true),
          ],
        ),
        const SizedBox(height: 16),
        InkWell(onTap: () => onNavigate('entreprise'), child: Row(mainAxisSize: MainAxisSize.min, children: [Text('Consulter l\'histoire & la gouvernance industrielle', style: AppTypography.labelLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)), const SizedBox(width: 6), const Icon(Icons.arrow_forward, size: 16, color: AppColors.primary)])),
      ]);
}

class _Pillar extends StatelessWidget {
  final IconData icon;
  final String title, desc;
  final bool orange;
  const _Pillar({required this.icon, required this.title, required this.desc, this.orange = false});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 8)], border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: orange ? const Color(0xFFFFDBCA) : const Color(0xFFD4E3FF), borderRadius: BorderRadius.circular(4)), child: Icon(icon, size: 18, color: orange ? AppColors.secondary : AppColors.primary)),
          const SizedBox(height: 8),
          Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 14)),
          const SizedBox(height: 4),
          Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12), maxLines: 3, overflow: TextOverflow.ellipsis),
        ]),
      );
}

class _ProductsSection extends StatelessWidget {
  final void Function(String) onNavigate;
  const _ProductsSection({required this.onNavigate});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      width: double.infinity,
      color: AppColors.surfaceContainerLow,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
          child: Column(children: [
            SectionHeader(
              eyebrow: 'Catalogue Spécialisé BTP & Génie Civil',
              title: 'Gamme de ciments haute performance certifiés',
              description: 'Des liants hydrauliques conçus pour résister au climat équatorial gabonais, de la maçonnerie courante aux barrages hydroélectriques de haute sécurité.',
              action: ElevatedButton.icon(
                onPressed: () => onNavigate('produits'),
                icon: const Icon(Icons.download_outlined, size: 16),
                label: Text('TÉLÉCHARGER LE GUIDE TECHNIQUE', style: AppTypography.labelMd.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              ),
            ),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: isMobile ? 1 : 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: isMobile ? 0.85 : 0.62,
              children: [
                ProductCard(
                  badge: 'Ouvrages Spéciaux & Barrages',
                  badgeColor: AppColors.primary,
                  badgeTextColor: Colors.white,
                  norm: 'EN 197-1',
                  title: 'CEM III/A 42.5 N LH',
                  subtitle: 'Ciment de haut fourneau à faible chaleur d\'hydratation',
                  resistance: '≥ 42.5 MPa',
                  resistanceRatio: 0.85,
                  secondaryLabel: 'Résistance agression marine :',
                  secondaryValue: 'Très Élevée',
                  bullets: const ['Idéal pour barrages hydrauliques et béton de masse.', 'Résistance exceptionnelle aux eaux sulfatées et agressives.', 'Conditionnement : Vrac & Big Bag 1.5 T.'],
                  primaryCta: 'Demander une cotation vrac',
                  onPrimary: () => onNavigate('devis'),
                ),
                ProductCard(
                  badge: 'Gros Œuvre & Béton Armé',
                  badgeColor: AppColors.secondaryFixed,
                  badgeTextColor: AppColors.onSecondaryFixed,
                  norm: 'CPJ 45',
                  title: 'CEM II/B-M 42,5 N',
                  subtitle: 'Ciment composé polyvalent à haute performance mécanique',
                  resistance: '≥ 42.5 MPa',
                  resistanceRatio: 0.80,
                  secondaryLabel: 'Maniabilité & Pompabilité :',
                  secondaryValue: 'Optimale',
                  bullets: const ['Poutres, poteaux, planchers, fondations et radiers.', 'Prise rapide adaptée aux cadences de décoffrage exigeantes.', 'Disponible en sacs de 50kg et camions-citernes vrac.'],
                  primaryCta: 'Demander une cotation BTP',
                  onPrimary: () => onNavigate('devis'),
                  accentTop: 'orange',
                ),
                ProductCard(
                  badge: 'Bâtiment Courant & Finitions',
                  badgeColor: AppColors.surfaceContainerHigh,
                  badgeTextColor: AppColors.primary,
                  norm: 'CPJ 35',
                  title: 'CEM II/B-M 32,5 N',
                  subtitle: 'Ciment classique de qualité artisanale et résidentielle',
                  resistance: '≥ 32.5 MPa',
                  resistanceRatio: 0.65,
                  secondaryLabel: 'Adhérence mortier & enduit :',
                  secondaryValue: 'Excellente',
                  bullets: const ['Travaux de maçonnerie, chape, crépissage et dallages.', 'Faible risque de fissuration et excellente plasticité.', 'Format standardisé : Sac kraft indéchirable 50kg.'],
                  primaryCta: 'Trouver un distributeur agréé',
                  onPrimary: () => onNavigate('contact'),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  final void Function(String) onNavigate;
  const _ProjectsSection({required this.onNavigate});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
          child: Column(children: [
            SectionHeader(
              eyebrow: 'Chantiers Emblématiques',
              title: 'Au cœur des grands édifices de la République',
              description: 'De la production d\'énergie verte aux corridors de transport stratégiques, les formulations CIMAF accompagnent les réalisations majeures du Gabon.',
              action: OutlinedButton.icon(
                onPressed: () => onNavigate('realisations'),
                icon: const Icon(Icons.arrow_forward, size: 16),
                label: const Text('TOUTES LES RÉALISATIONS'),
              ),
            ),
            const SizedBox(height: 24),
            if (isMobile)
              Column(children: [_ProjectCardLarge(onNavigate: onNavigate), const SizedBox(height: 16), _ProjectCardSmallTowers()])
            else
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(flex: 8, child: _ProjectCardLarge(onNavigate: onNavigate)), const SizedBox(width: 16), Expanded(flex: 4, child: _ProjectCardSmallTowers())]),
          ]),
        ),
      ),
    );
  }
}

class _ProjectCardLarge extends StatelessWidget {
  final void Function(String) onNavigate;
  const _ProjectCardLarge({required this.onNavigate});
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => onNavigate('realisations'),
        child: Container(
          height: 380,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: const [BoxShadow(color: Color(0x20000000), blurRadius: 16)]),
          clipBehavior: Clip.antiAlias,
          child: Stack(children: [
            CachedNetworkImage(
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBc2OzLfVikweietsepYiYLi5xoIUCa1QCLSxFUJ10rvE-v6U4ZAWfJu71huFAsFiTZzfSiWV5ifA6mWWjmuiCHxpehot_chgZYZvqQz85MxZc4H201x2oM5AQxP_ngo2mJ24fNgcrTyVM-klZpcVinlgaJKI7IhUYgLWQ2yJJjRDSiSJvL8azsfEyY-odEkC-b74a38VzLSEWaaBSeDPFPvjIiLRzHswuF1KmHDFj_j0tMFqHJ0pzJ',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 380,
              errorWidget: (_, __, ___) => Container(color: AppColors.primary),
            ),
            Positioned.fill(child: Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Color(0xFF131B2E)])))),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Wrap(spacing: 8, children: [
                  Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(4)), child: Text('ÉNERGIE PROPRE & BARRAGE', style: AppTypography.labelTechnical.copyWith(color: Colors.white, fontSize: 10))),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(4)), child: Text('CEM III/A 42.5 N LH', style: AppTypography.labelTechnical.copyWith(color: Colors.white, fontSize: 10))),
                ]),
                const SizedBox(height: 10),
                Text('Barrage Hydroélectrique de Kinguélé Aval (35 MW)', style: AppTypography.headlineLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 22)),
                const SizedBox(height: 6),
                Text('Fourniture technique de ciments de haut fourneau à faible exothermie pour le coulage massif du barrage-poids, garantissant l\'absence de fissuration thermique sous le climat équatorial.',
                    style: AppTypography.bodySm.copyWith(color: const Color(0xFFE2E7FF))),
              ]),
            ),
          ]),
        ),
      );
}

class _ProjectCardSmallTowers extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 380,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.primary),
        clipBehavior: Clip.antiAlias,
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=600',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 380,
            errorWidget: (_, __, ___) => Container(color: AppColors.primary),
          ),
          Positioned.fill(child: Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Color(0xFF0F172A)])))),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFFFDBCA), borderRadius: BorderRadius.circular(4)), child: Text('TOUR MODERNE & HUB D\'AFFAIRES', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary, fontSize: 10))),
              const SizedBox(height: 8),
              Text('Tour Libreville Modern — Béton haute résistance', style: AppTypography.titleSm.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
              Text('Centre d\'affaires R+15, façade structurelle coulée en CEM II/B-M 42.5 N', style: AppTypography.bodySm.copyWith(color: const Color(0xFFE2E7FF), fontSize: 12)),
            ]),
          ),
        ]),
      );
}

class _RseBanner extends StatelessWidget {
  final void Function(String) onNavigate;
  const _RseBanner({required this.onNavigate});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 48, vertical: 16),
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
      child: isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: _bannerContent(context))
          : Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: _bannerContent(context))), const SizedBox(width: 24), _RseMetrics()]),
    );
  }

  List<Widget> _bannerContent(BuildContext context) => [
        Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(4)), child: Text('RSE & ENGAGEMENT CITOYEN', style: AppTypography.labelTechnical.copyWith(color: Colors.white, fontSize: 10))),
        const SizedBox(height: 12),
        Text('Écoles & Vocations : 4 200 jeunes formés aux métiers de l\'industrie', style: AppTypography.headlineMd.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        Text('Depuis Owendo, nous bâtissons deux ouvrages : des infrastructures et des destinées. Programme de 35 écoles réhabilitées, bourses techniques et compagnonnage en usine.',
            style: AppTypography.bodyMd.copyWith(color: const Color(0xFFE2E7FF))),
        const SizedBox(height: 16),
        if (MediaQuery.of(context).size.width < 700) _RseMetrics(),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () => onNavigate('rse'),
          icon: const Icon(Icons.backpack_outlined, size: 16),
          label: Text('DÉCOUVRIR LE PROGRAMME RSE', style: AppTypography.labelMd.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
        ),
      ];
}

class _RseMetrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white.withOpacity(0.15))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _Metric(value: '35+', label: 'ÉCOLES\nRÉNOVÉES'),
          Container(width: 1, height: 40, color: Colors.white24),
          _Metric(value: '120', label: 'BOURSES\n/AN'),
          Container(width: 1, height: 40, color: Colors.white24),
          _Metric(value: '4 200', label: 'ÉLÈVES\nFORMÉS'),
        ]),
      );
}

class _Metric extends StatelessWidget {
  final String value, label;
  const _Metric({required this.value, required this.label});
  @override
  Widget build(BuildContext context) => Column(children: [Text(value, style: AppTypography.headlineLg.copyWith(color: const Color(0xFFFFDBCA), fontWeight: FontWeight.w800)), Text(label, textAlign: TextAlign.center, style: AppTypography.labelTechnical.copyWith(color: Colors.white, fontSize: 10, height: 1.2))]);
}

class _NewsPreview extends StatelessWidget {
  final void Function(String) onNavigate;
  const _NewsPreview({required this.onNavigate});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
          child: Column(children: [
            SectionHeader(eyebrow: 'Actualités & Presse', title: 'Dernières actualités industrielles', action: TextButton.icon(onPressed: () => onNavigate('actualites'), icon: const Icon(Icons.arrow_forward, size: 16), label: const Text('TOUTES LES ACTUALITÉS'))),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: isMobile ? 1 : 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: isMobile ? 1.8 : 1.2,
              children: [
                _NewsCard(date: '11 SEPT 2026', title: 'CIMAF Gabon certifie sa production CEM III bas-carbone', excerpt: 'Nouvelle formulation à 62% de laitier, -38% d\'empreinte CO₂, validée par le LNE Gabon.', image: 'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=600'),
                _NewsCard(date: '28 AOÛT 2026', title: 'Inauguration du dépôt de Franceville — 3 000 T de capacité', excerpt: 'Maillon stratégique pour l\'approvisionnement du Haut-Ogooué et les chantiers miniers.', image: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=600'),
                _NewsCard(date: '15 AOÛT 2026', title: '35 écoles livrées : la jeunesse d\'Owendo à l\'honneur', excerpt: 'Rénovation complète de 12 établissements primaires et 3 lycées techniques.', image: 'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=600'),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  final String date, title, excerpt, image;
  const _NewsCard({required this.date, required this.title, required this.excerpt, required this.image});
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
        clipBehavior: Clip.antiAlias,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CachedNetworkImage(imageUrl: image, height: 140, width: double.infinity, fit: BoxFit.cover, errorWidget: (_, __, ___) => Container(height: 140, color: AppColors.surfaceContainerHighest)),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(date, style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary, fontSize: 10)),
              const SizedBox(height: 6),
              Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 14), maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 6),
              Text(excerpt, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
            ]),
          ),
        ]),
      );
}
