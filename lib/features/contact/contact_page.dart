import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/osm_map_card.dart';
import '../../core/constants/app_location.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
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
                Text('CONTACT', style: AppTypography.labelTechnical.copyWith(color: const Color(0xFFFFDBCA))),
                const SizedBox(height: 8),
                Text('Parlons de votre projet — réponse sous 24h', style: AppTypography.headlineLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
                Text('Owendo, Franceville, Ntoum : nos équipes commerciales et techniques à votre écoute.', style: AppTypography.bodyLg.copyWith(color: const Color(0xFFE2E7FF))),
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48, vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.contentMaxWidth),
              child: isMobile
                  ? Column(children: [_ContactForm(), const SizedBox(height: 16), _ContactInfos()])
                  : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(flex: 3, child: _ContactForm()), const SizedBox(width: 24), Expanded(flex: 2, child: _ContactInfos())]),
            ),
          ),
        ),
      ]),
    );
  }
}

class _ContactForm extends StatefulWidget {
  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Envoyez-nous un message', style: AppTypography.headlineSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Nom *', hintText: 'Votre nom'), validator: (v) => v!.isEmpty ? 'Requis' : null)),
              const SizedBox(width: 12),
              Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Société'), validator: (v) => null)),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Téléphone *', hintText: '+241 ...'), validator: (v) => v!.isEmpty ? 'Requis' : null)),
              const SizedBox(width: 12),
              Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Email *', hintText: 'vous@entreprise.ga'), validator: (v) => v!.isEmpty ? 'Requis' : null)),
            ]),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(decoration: const InputDecoration(labelText: 'Sujet'), items: const [DropdownMenuItem(value: 'devis', child: Text('Demande de devis')), DropdownMenuItem(value: 'technique', child: Text('Support technique')), DropdownMenuItem(value: 'distrib', child: Text('Devenir distributeur')), DropdownMenuItem(value: 'autre', child: Text('Autre'))], onChanged: (_) {}),
            const SizedBox(height: 12),
            TextFormField(maxLines: 4, decoration: const InputDecoration(labelText: 'Message *', hintText: 'Décrivez votre besoin : volume, produit, lieu de livraison...'), validator: (v) => v!.isEmpty ? 'Requis' : null),
            const SizedBox(height: 12),
            Row(children: [Checkbox(value: false, onChanged: (_) {}), Expanded(child: Text('J\'accepte la politique de confidentialité CIMAF Gabon.', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12)))]),
            const SizedBox(height: 12),
            SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () { if (_formKey.currentState!.validate()) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Message envoyé — réponse sous 24h (simulation)'))); }, icon: const Icon(Icons.send_outlined, size: 16), label: Text('ENVOYER LE MESSAGE', style: AppTypography.labelLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800)))),
          ]),
        ),
      );
}

class _ContactInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(children: [
        _InfoCard(
          icon: Icons.location_on_outlined,
          title: 'Siège & Usine Owendo — OSM ${AppLocation.plusCodeShort}',
          lines: [
            AppLocation.owendoLabel,
            'BP 1234 Libreville, Gabon',
            'Plus Code: ${AppLocation.plusCodeFull} (${AppLocation.plusCodeShort})',
            'Coords: ${AppLocation.displayCoords}',
            'Lun-Ven 07:30-17:00 • Sam 08:00-12:00'
          ],
        ),
        const SizedBox(height: 12),
        _InfoCard(icon: Icons.call_outlined, title: 'Téléphones', lines: const ['Standard : +241 11 70 58 00', 'Commercial BTP : +241 06 12 34 56', 'Urgence logistique : +241 06 98 76 54']),
        const SizedBox(height: 12),
        _InfoCard(icon: Icons.mail_outline, title: 'Emails', lines: const ['contact@cimaf-gabon.ga', 'commercial@cimaf-gabon.ga', 'rse@cimaf-gabon.ga']),
        const SizedBox(height: 12),
        const OsmMapCard(),
      ]);
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> lines;
  const _InfoCard({required this.icon, required this.title, required this.lines});
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.primaryFixed, borderRadius: BorderRadius.circular(6)), child: Icon(icon, size: 18, color: AppColors.primary)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 14)), const SizedBox(height: 6), for (final l in lines) Text(l, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12))]))]),
      );
}
