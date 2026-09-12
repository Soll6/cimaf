import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

class DevisPage extends StatefulWidget {
  const DevisPage({super.key});
  @override
  State<DevisPage> createState() => _DevisPageState();
}

class _DevisPageState extends State<DevisPage> {
  String produit = 'CEM II/B-M 42,5 N';
  String conditionnement = 'Sacs 50kg';
  final qtyCtrl = TextEditingController(text: '20');
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
                Text('DEMANDE DE DEVIS', style: AppTypography.labelTechnical.copyWith(color: const Color(0xFFFFDBCA))),
                const SizedBox(height: 8),
                Text('Obtenez votre cotation en 24h', style: AppTypography.headlineLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
                Text('Vrac, sacs, Big Bag — livraison Owendo, Franceville, Ntoum & réseau national.', style: AppTypography.bodyLg.copyWith(color: const Color(0xFFE2E7FF))),
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
                  ? Column(children: [_FormCard(produit: produit, conditionnement: conditionnement, qtyCtrl: qtyCtrl, onProduit: (v) => setState(() => produit = v), onCond: (v) => setState(() => conditionnement = v)), const SizedBox(height: 16), _Recap(produit: produit, conditionnement: conditionnement, qty: qtyCtrl.text)])
                  : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(flex: 3, child: _FormCard(produit: produit, conditionnement: conditionnement, qtyCtrl: qtyCtrl, onProduit: (v) => setState(() => produit = v), onCond: (v) => setState(() => conditionnement = v))), const SizedBox(width: 24), Expanded(flex: 2, child: _Recap(produit: produit, conditionnement: conditionnement, qty: qtyCtrl.text))]),
            ),
          ),
        ),
      ]),
    );
  }
}

class _FormCard extends StatelessWidget {
  final String produit, conditionnement;
  final TextEditingController qtyCtrl;
  final ValueChanged<String> onProduit, onCond;
  const _FormCard({required this.produit, required this.conditionnement, required this.qtyCtrl, required this.onProduit, required this.onCond});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Configuration produit', style: AppTypography.headlineSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800)),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(value: produit, decoration: const InputDecoration(labelText: 'Produit'), items: const [DropdownMenuItem(value: 'CEM III/A 42.5 N LH', child: Text('CEM III/A 42.5 N LH — Ouvrages spéciaux')), DropdownMenuItem(value: 'CEM II/B-M 42,5 N', child: Text('CEM II/B-M 42,5 N — Gros œuvre')), DropdownMenuItem(value: 'CEM II/B-M 32,5 N', child: Text('CEM II/B-M 32,5 N — Bâtiment courant'))], onChanged: (v) => onProduit(v!)),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(value: conditionnement, decoration: const InputDecoration(labelText: 'Conditionnement'), items: const [DropdownMenuItem(value: 'Sacs 50kg', child: Text('Sacs 50kg — palette 40 sacs')), DropdownMenuItem(value: 'Big Bag 1.5T', child: Text('Big Bag 1.5T')), DropdownMenuItem(value: 'Vrac citerne', child: Text('Vrac citerne 25-30T'))], onChanged: (v) => onCond(v!)),
          const SizedBox(height: 12),
          Row(children: [Expanded(child: TextFormField(controller: qtyCtrl, decoration: const InputDecoration(labelText: 'Quantité'), keyboardType: TextInputType.number)), const SizedBox(width: 12), Expanded(child: DropdownButtonFormField<String>(value: 'Tonnes', decoration: const InputDecoration(labelText: 'Unité'), items: const [DropdownMenuItem(value: 'Tonnes', child: Text('Tonnes')), DropdownMenuItem(value: 'Sacs', child: Text('Sacs'))], onChanged: (_) {}))]),
          const SizedBox(height: 12),
          TextFormField(decoration: const InputDecoration(labelText: 'Lieu de livraison *', hintText: 'Ex: Chantier Owendo, PK12'), validator: (v) => v!.isEmpty ? 'Requis' : null),
          const SizedBox(height: 12),
          TextFormField(decoration: const InputDecoration(labelText: 'Date souhaitée', hintText: 'JJ/MM/AAAA'), readOnly: true, onTap: () {}),
          const SizedBox(height: 12),
          TextFormField(maxLines: 3, decoration: const InputDecoration(labelText: 'Précisions', hintText: 'Accès camion, contraintes chantier...')),
          const SizedBox(height: 16),
          Text('Coordonnées', style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          Row(children: [Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Nom *'))), const SizedBox(width: 12), Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Téléphone *')))]),
          const SizedBox(height: 12),
          TextFormField(decoration: const InputDecoration(labelText: 'Email *')),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Demande envoyée — cotation sous 24h (simulation)'))), icon: const Icon(Icons.send_outlined, size: 16), label: Text('ENVOYER LA DEMANDE', style: AppTypography.labelLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800)))),
          const SizedBox(height: 8),
          Text('Réponse garantie sous 24h ouvrées. Prix départ usine Owendo, transport en sus selon distance.', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11), textAlign: TextAlign.center),
        ]),
      );
}

class _Recap extends StatelessWidget {
  final String produit, conditionnement, qty;
  const _Recap({required this.produit, required this.conditionnement, required this.qty});
  @override
  Widget build(BuildContext context) => Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(8), border: const Border(left: BorderSide(color: AppColors.secondary, width: 4))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('RÉCAPITULATIF', style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary)),
            const SizedBox(height: 12),
            _Line(label: 'Produit', value: produit),
            _Line(label: 'Conditionnement', value: conditionnement),
            _Line(label: 'Quantité', value: '$qty T'),
            const Divider(),
            _Line(label: 'Disponibilité', value: 'En stock Owendo', valueColor: AppColors.success),
            const SizedBox(height: 8),
            Text('Estimation indicative : sur devis. Grille dégressive dès 100T. Big Bag & vrac : -7% vs sac.', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11)),
          ]),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [const Icon(Icons.support_agent_outlined, size: 18, color: AppColors.primary), const SizedBox(width: 8), Text('Besoin d\'un conseil technique ?', style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 13))]),
            const SizedBox(height: 8),
            Text('Nos ingénieurs vous orientent vers la formulation optimale selon votre ouvrage et climat.', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12)),
            const SizedBox(height: 8),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.call_outlined, size: 16), label: const Text('Appeler le support')),
          ]),
        ),
      ]);
}

class _Line extends StatelessWidget {
  final String label, value;
  final Color? valueColor;
  const _Line({required this.label, required this.value, this.valueColor});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)), Text(value, style: AppTypography.bodySm.copyWith(color: valueColor ?? AppColors.onSurface, fontWeight: FontWeight.w700))]),
      );
}
