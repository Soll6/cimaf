import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/cmaf_app_bar.dart';
import 'core/widgets/cmaf_footer.dart';
import 'core/constants/app_nav.dart';
import 'features/home/home_page.dart';
import 'features/entreprise/entreprise_page.dart';
import 'features/produits/produits_page.dart';
import 'features/realisations/realisations_page.dart';
import 'features/rse/rse_page.dart';
import 'features/carrieres/carrieres_page.dart';
import 'features/contact/contact_page.dart';
import 'features/devis/devis_page.dart';
import 'features/ecoles/ecoles_page.dart';
import 'features/actualites/actualites_page.dart';

void main() {
  runApp(const CmafApp());
}

class CmafApp extends StatelessWidget {
  const CmafApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIMAF Gabon — Ciments de l\'Afrique',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const CmafShell(),
    );
  }
}

class CmafShell extends StatefulWidget {
  const CmafShell({super.key});
  @override
  State<CmafShell> createState() => _CmafShellState();
}

class _CmafShellState extends State<CmafShell> {
  String _route = 'accueil';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _navigate(String r) {
    setState(() => _route = r);
    if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      Navigator.of(context).pop();
    }
    // scroll to top
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 200));
      }
    });
  }

  Widget _pageFor(String route) {
    switch (route) {
      case 'accueil':
        return HomePage(onNavigate: _navigate);
      case 'entreprise':
        return const EntreprisePage();
      case 'produits':
        return ProduitsPage(onNavigate: _navigate);
      case 'realisations':
        return const RealisationsPage();
      case 'rse':
        return const RsePage();
      case 'carrieres':
        return const CarrieresPage();
      case 'contact':
        return const ContactPage();
      case 'devis':
        return const DevisPage();
      case 'ecoles':
        return const EcolesPage();
      case 'actualites':
        return const ActualitesPage();
      default:
        return HomePage(onNavigate: _navigate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(108),
        child: CmafAppBar(activeRoute: _route, onNavigate: _navigate),
      ),
      endDrawer: Drawer(
        child: ListView(padding: const EdgeInsets.only(top: 24), children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(children: [
              Image.asset('assets/icon/cimaf_logo.png', height: 28, width: 28, fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Icon(Icons.apartment, color: Color(0xFF003F76))),
              const SizedBox(width: 8),
              Text('CIMAF GABON', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF003F76)))
            ]),
          ),
          const Divider(),
          for (final nav in AppNav.drawerItems)
            ListTile(
              leading: Icon(nav.icon, size: 20, color: _route == nav.route ? const Color(0xFF00569E) : const Color(0xFF424751)),
              title: Text(nav.label, style: TextStyle(fontWeight: _route == nav.route ? FontWeight.w800 : FontWeight.w500, color: _route == nav.route ? const Color(0xFF00569E) : const Color(0xFF131B2E))),
              selected: _route == nav.route,
              onTap: () => _navigate(nav.route),
            ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Usine d\'Owendo — Zone Industrielle', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 4),
              Text('+241 11 70 58 00 • contact@cimaf-gabon.ga', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFF003F76), fontWeight: FontWeight.w700)),
            ]),
          ),
        ]),
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              AnimatedSwitcher(duration: const Duration(milliseconds: 250), child: KeyedSubtree(key: ValueKey(_route), child: _pageFor(_route))),
              CmafFooter(onNavigate: _navigate),
            ]),
          ),
        ),
      ]),
    );
  }
}
