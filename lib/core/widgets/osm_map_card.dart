import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../constants/app_location.dart';

class OsmMapCard extends StatelessWidget {
  const OsmMapCard({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 8)],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header OSM
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: AppColors.surfaceContainerLow,
            child: Row(
              children: [
                const Icon(Icons.map_outlined, size: 14, color: AppColors.primary),
                const SizedBox(width: 6),
                Text('OPENSTREETMAP', style: AppTypography.labelTechnical.copyWith(color: AppColors.primary, fontSize: 10)),
                const Spacer(),
                Text(AppLocation.displayPlusCode, style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary, fontSize: 10)),
              ],
            ),
          ),
          // Map
          SizedBox(
            height: 220,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: AppLocation.plusCodeLatLng,
                initialZoom: 15,
                interactionOptions: const InteractionOptions(flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'ga.cimaf.portail',
                  maxZoom: 19,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: AppLocation.plusCodeLatLng,
                      width: 36,
                      height: 36,
                      child: const Icon(Icons.location_on, color: AppColors.secondary, size: 36),
                    ),
                    Marker(
                      point: AppLocation.owendoLatLng,
                      width: 28,
                      height: 28,
                      child: const Icon(Icons.factory, color: AppColors.primary, size: 22),
                    ),
                  ],
                ),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution('© OpenStreetMap contributors', onTap: () => _open('https://www.openstreetmap.org/copyright')),
                  ],
                ),
              ],
            ),
          ),
          // Infos localisation
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.secondaryFixed, borderRadius: BorderRadius.circular(4)),
                      child: Text(AppLocation.plusCodeShort, style: AppTypography.labelTechnical.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w800)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text('Libreville • Estuaire', style: AppTypography.labelTechnical.copyWith(color: AppColors.onSurfaceVariant)),
                    ),
                    Text(AppLocation.displayCoords, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Siège & Usine — ${AppLocation.owendoLabel}', style: AppTypography.titleSm.copyWith(fontWeight: FontWeight.w800, fontSize: 13, color: AppColors.primary)),
                Text('BP 1234 Libreville, Gabon • Lun-Ven 07:30-17:00 • Sam 08:00-12:00', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: AppColors.outline),
                    const SizedBox(width: 4),
                    Expanded(child: Text('Plus Code: ${AppLocation.plusCodeFull} • OSM 16z', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11))),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    SizedBox(
                      height: 36,
                      child: ElevatedButton.icon(
                        onPressed: () => _open(AppLocation.osmCoordUrl),
                        icon: const Icon(Icons.open_in_new, size: 14),
                        label: Text('VOIR SUR OSM', style: AppTypography.labelMd.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(horizontal: 12)),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      child: OutlinedButton.icon(
                        onPressed: () => _open(AppLocation.plusCodesUrl),
                        icon: const Icon(Icons.qr_code_2_outlined, size: 14),
                        label: Text('PLUS.CODES', style: AppTypography.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 12)),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      child: OutlinedButton.icon(
                        onPressed: () => _open('https://www.google.com/maps/search/?api=1&query=${AppLocation.plusCodeLatLng.latitude},${AppLocation.plusCodeLatLng.longitude}'),
                        icon: const Icon(Icons.map_outlined, size: 14),
                        label: Text('GOOGLE MAPS', style: AppTypography.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Itinéraire : RN1 → Owendo → Zone Industrielle — accès port & voie ferrée. Livraison vrac 80 camions/j.', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
