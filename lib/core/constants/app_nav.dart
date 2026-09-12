import 'package:flutter/material.dart';

/// Navigation canonique CIMAF — source unique pour AppBar + Sidebar
/// Harmonisée à 8 liens primaires + 2 pages d'action = 10 routes totales.
/// Au format mobile, AppBar (via drawer) et Sidebar affichent le MÊME nombre.
class NavItem {
  final String route;
  final String label;
  final IconData icon;
  const NavItem(this.route, this.label, this.icon);
}

class AppNav {
  AppNav._();

  /// Liste canonique — 10 routes (utilisée par AppBar et Drawer)
  static const List<NavItem> items = [
    NavItem('accueil', 'Accueil', Icons.home_outlined),
    NavItem('entreprise', 'L\'Entreprise', Icons.business_outlined),
    NavItem('produits', 'Nos Produits', Icons.inventory_2_outlined),
    NavItem('realisations', 'Réalisations', Icons.architecture_outlined),
    NavItem('rse', 'RSE & Engagement', Icons.eco_outlined),
    NavItem('carrieres', 'Carrières', Icons.work_outline),
    NavItem('ecoles', 'Écoles & Vocations', Icons.school_outlined),
    NavItem('actualites', 'Actualités', Icons.newspaper_outlined),
    NavItem('contact', 'Contact', Icons.mail_outline),
    NavItem('devis', 'Demande de Devis', Icons.request_quote_outlined),
  ];

  /// Drawer mobile — 10 routes complètes (toutes accessibles en hamburger)
  static List<NavItem> get drawerItems => items;

  /// AppBar desktop — 8 liens texte + 2 CTAs boutons = 10 distincts sans duplication
  /// Écoles & Devis sont rendus comme boutons CTA, pas comme liens texte
  static List<NavItem> get appBarItems => items.where((e) => e.route != 'ecoles' && e.route != 'devis').toList();

  /// Compat : ancien getter = desktop
  static List<NavItem> get appBarDesktopItems => appBarItems;

  static bool isValidRoute(String r) => items.any((e) => e.route == r);
}
