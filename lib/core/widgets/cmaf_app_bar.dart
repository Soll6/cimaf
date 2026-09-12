import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';
import '../constants/app_nav.dart';

class CmafTopInfoBar extends StatelessWidget {
  const CmafTopInfoBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Icon(Icons.factory_outlined, size: 16, color: Color(0xFFFFDBCA)),
                const SizedBox(width: 6),
                Text('Usine d\'Owendo • Franceville • Ntoum', style: AppTypography.labelMd.copyWith(color: Colors.white, letterSpacing: 0.3)),
                const SizedBox(width: 16),
                if (MediaQuery.of(context).size.width > 700) ...[
                  const Icon(Icons.call_outlined, size: 16, color: Color(0xFFE2E7FF)),
                  const SizedBox(width: 6),
                  Text('+241 11 70 58 00', style: AppTypography.labelMd.copyWith(color: const Color(0xFFE2E7FF))),
                ],
                const SizedBox(width: 16),
                const Row(children: [
                  Icon(Icons.school_outlined, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text('ESPACE PRO & ÉCOLES', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 0.88)),
                ]),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(color: const Color(0x9900569E), borderRadius: BorderRadius.circular(4)),
                  child: Row(children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                        child: Text('FR', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Color(0xFF003F76)))),
                    const SizedBox(width: 4),
                    const Text('EN', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)),
                    const SizedBox(width: 6),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CmafAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String activeRoute;
  final ValueChanged<String> onNavigate;
  const CmafAppBar({super.key, required this.activeRoute, required this.onNavigate});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 960;
    final isCompactDesktop = screenWidth >= 960 && screenWidth < 1280;

    return Material(
      color: Colors.white.withOpacity(0.95),
      elevation: 1,
      shadowColor: const Color(0x0A000000),
      child: Column(
        children: [
          const CmafTopInfoBar(),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      // Logo
                      InkWell(
                        onTap: () => onNavigate('accueil'),
                        child: Row(children: [
                          Image.asset(
                            'assets/icon/cimaf_logo.png',
                            height: 32,
                            errorBuilder: (_, __, ___) => const Icon(Icons.apartment, color: AppColors.primary),
                          ),
                          const SizedBox(width: 8),
                          if (screenWidth > 400)
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('CIMAF', style: AppTypography.headlineSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800, height: 1, fontSize: isCompactDesktop ? 16 : 18)),
                              Text('GABON', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary, letterSpacing: 2, fontSize: isCompactDesktop ? 9 : 10)),
                            ]),
                        ]),
                      ),
                      const SizedBox(width: 8),
                      // Menu desktop : 10 liens au total (8 liens texte + 2 CTAs) harmonisés avec le sidebar
                      if (isDesktop) ...[
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (final nav in AppNav.appBarItems)
                                  _NavLink(
                                    label: nav.label,
                                    active: activeRoute == nav.route,
                                    onTap: () => onNavigate(nav.route),
                                    compact: isCompactDesktop,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        _CtaButton(
                          label: isCompactDesktop ? 'Écoles' : 'Écoles & Vocations',
                          icon: Icons.backpack_outlined,
                          color: AppColors.secondary,
                          compact: isCompactDesktop,
                          onTap: () => onNavigate('ecoles'),
                        ),
                        const SizedBox(width: 6),
                        _CtaButton(
                          label: isCompactDesktop ? 'Devis' : 'Demande de Devis',
                          color: AppColors.primary,
                          compact: isCompactDesktop,
                          onTap: () => onNavigate('devis'),
                        ),
                        const SizedBox(width: 8),
                      ] else ...[
                        const Spacer(),
                      ],
                      const CircleAvatar(radius: 15, backgroundColor: AppColors.primary, child: Icon(Icons.person, size: 16, color: Colors.white)),
                      if (!isDesktop) ...[
                        const SizedBox(width: 8),
                        Builder(
                          builder: (ctx) => IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  final bool compact;
  const _NavLink({required this.label, required this.active, required this.onTap, this.compact = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: compact ? 5 : 8, vertical: 8),
        child: Text(
          label,
          style: (active
                  ? AppTypography.labelLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)
                  : AppTypography.labelLg.copyWith(color: AppColors.onSurfaceVariant))
              .copyWith(fontSize: compact ? 11.5 : 12.5),
        ),
      ),
    );
  }
}

class _CtaButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color color;
  final bool compact;
  final VoidCallback onTap;
  const _CtaButton({required this.label, this.icon, required this.color, this.compact = false, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: compact ? 8 : 12, vertical: 7),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4), boxShadow: [BoxShadow(color: color.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 2))]),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: compact ? 14 : 15, color: Colors.white), SizedBox(width: compact ? 4 : 5)],
          Text(label.toUpperCase(), style: AppTypography.labelMd.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: compact ? 11 : 12)),
        ]),
      ),
    );
  }
}
