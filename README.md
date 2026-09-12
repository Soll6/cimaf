# CIMAF Gabon

Site web CIMAF Gabon construit avec Flutter.

## Déploiement Vercel

Le projet est configuré pour Vercel avec `vercel.json`. Chaque push sur `main`
déclenche automatiquement `scripts/vercel-build.sh`, qui construit la version
web dans `build/web`.

Dans Vercel, importe le dépôt GitHub `Soll6/cimaf`, sélectionne la branche
`main`, puis laisse les réglages de build détectés automatiquement. Le domaine
sera ensuite disponible dans l’onglet **Domains** du projet.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
