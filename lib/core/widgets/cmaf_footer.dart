import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';
import '../constants/app_location.dart';

class CmafFooter extends StatelessWidget {
  final ValueChanged<String> onNavigate;
  const CmafFooter({super.key, required this.onNavigate});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      color: AppColors.inverseSurface,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isMobile)
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: _footerColumns(context))
              else
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: _footerColumns(context).map((w) => Expanded(child: w)).toList()),
              const SizedBox(height: 32),
              const Divider(color: Color(0xFF334155)),
              const SizedBox(height: 16),
              Wrap(spacing: 16, runSpacing: 8, children: [
                Text('© 2026 CIMAF Gabon — Ciments de l\'Afrique', style: AppTypography.bodySm.copyWith(color: const Color(0xFFBDCBE4))),
                Text('NF EN 197-1 • ISO 9001:2015 • Owendo — Estuaire', style: AppTypography.labelMd.copyWith(color: const Color(0xFFBDCBE4))),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _footerColumns(BuildContext context) => [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () => onNavigate('accueil'),
            child: Row(children: [
              Image.asset('assets/icon/cimaf_logo.png', height: 28, width: 28, fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Icon(Icons.apartment, color: Colors.white, size: 22)),
              const SizedBox(width: 8),
              Text('CIMAF', style: AppTypography.headlineSm.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
              const SizedBox(width: 6),
              Text('GABON', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondaryFixed)),
            ]),
          ),
          const SizedBox(height: 12),
          Text('Bâtisseur d\'avenir industriel depuis 2015. Production nationale certifiée depuis Owendo.',
              style: AppTypography.bodySm.copyWith(color: const Color(0xFFBDCBE4))),
          const SizedBox(height: 12),
          Row(children: [
            _SocialIcon(icon: Icons.language, onTap: () => _launch(AppLocation.osmCoordUrl)),
            const SizedBox(width: 8),
            _SocialIcon(icon: Icons.share, onTap: () => _launch('https://www.openstreetmap.org/copyright')),
            const SizedBox(width: 8),
            _SocialIcon(icon: Icons.mail_outline, onTap: () => _launch('mailto:contact@cimaf-gabon.ga')),
          ]),
        ]),
        _FooterCol(
          title: 'Navigation',
          links: const [
            ('Accueil', 'accueil'),
            ('L\'Entreprise', 'entreprise'),
            ('Nos Produits', 'produits'),
            ('Réalisations', 'realisations'),
            ('Actualités', 'actualites'),
          ],
          onNavigate: onNavigate,
        ),
        _FooterCol(
          title: 'Expertise',
          links: const [
            ('Fiches Techniques', 'produits'),
            ('Guide Béton', 'produits'),
            ('Réseau Distributeurs', 'contact'),
            ('Devis Vrac', 'devis'),
            ('Laboratoire', 'entreprise'),
          ],
          onNavigate: onNavigate,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Contact Owendo — OSM 8F7R+27G', style: AppTypography.labelTechnical.copyWith(color: Colors.white)),
          const SizedBox(height: 12),
          _ContactRow(icon: Icons.location_on_outlined, text: 'Zone Industrielle d\'Owendo\nBP 1234 Libreville, Gabon\nPlus Code: 8F7R+27G • 0.31256° N, 9.49070° E', onTap: () => _launch(AppLocation.osmCoordUrl)),
          const SizedBox(height: 8),
          _ContactRow(icon: Icons.call_outlined, text: '+241 11 70 58 00', onTap: () => _launch('tel:+24111705800')),
          const SizedBox(height: 8),
          _ContactRow(icon: Icons.mail_outline, text: 'contact@cimaf-gabon.ga', onTap: () => _launch('mailto:contact@cimaf-gabon.ga')),
        ]),
      ];
}

class _FooterCol extends StatelessWidget {
  final String title;
  final List<(String, String)> links;
  final ValueChanged<String> onNavigate;
  const _FooterCol({required this.title, required this.links, required this.onNavigate});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title.toUpperCase(), style: AppTypography.labelTechnical.copyWith(color: Colors.white)),
        const SizedBox(height: 12),
        for (final l in links)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: InkWell(
              onTap: () => onNavigate(l.$2),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(l.$1, style: AppTypography.bodySm.copyWith(color: const Color(0xFFBDCBE4), decoration: TextDecoration.underline, decorationColor: const Color(0x4DBDCBE4))),
              ),
            ),
          ),
      ]),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _SocialIcon({required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFF334155), borderRadius: BorderRadius.circular(4)), child: Icon(icon, size: 14, color: Colors.white)),
      );
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const _ContactRow({required this.icon, required this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    final row = Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, size: 16, color: AppColors.secondaryFixed), const SizedBox(width: 8), Expanded(child: Text(text, style: AppTypography.bodySm.copyWith(color: const Color(0xFFBDCBE4))))]);
    if (onTap == null) return row;
    return InkWell(onTap: onTap, child: Padding(padding: const EdgeInsets.symmetric(vertical: 2), child: row));
  }
}
