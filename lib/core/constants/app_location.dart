import 'package:latlong2/latlong.dart';

/// Localisation officielle CIMAF Gabon — OSM Plus Code 8F7R+27G, Libreville
/// Décodé via openlocationcode (full: 6FGF8F7R+27G)
/// Centre: 0.3125625 N, 9.4907031 E (référence Libreville 0.3924,9.4535)
/// Fallback centre-ville Libreville pour contexte : 0.39241, 9.45356
class AppLocation {
  AppLocation._();

  // Plus Code court fourni par le client
  static const plusCodeShort = '8F7R+27G';
  static const plusCodeFull = '6FGF8F7R+27G';
  static const locality = 'Libreville';
  static const country = 'Gabon';

  // Coordonnées décodées (centre du Plus Code)
  static const LatLng plusCodeLatLng = LatLng(0.3125625, 9.4907031);

  // Siège réel CIMAF Owendo (Zone Industrielle) — pour référence opérationnelle
  static const LatLng owendoLatLng = LatLng(0.348, 9.506);
  static const String owendoLabel = 'Zone Industrielle d\'Owendo';

  // Centre administratif Libreville (GNSS)
  static const LatLng librevilleCenter = LatLng(0.39241, 9.45356);

  // URLs OSM
  static String get osmPlusCodeUrl => 'https://www.openstreetmap.org/search?query=${Uri.encodeComponent('$plusCodeShort $locality $country')}';
  static String get osmCoordUrl => 'https://www.openstreetmap.org/?mlat=${plusCodeLatLng.latitude}&mlon=${plusCodeLatLng.longitude}#map=16/${plusCodeLatLng.latitude}/${plusCodeLatLng.longitude}';
  static String get plusCodesUrl => 'https://plus.codes/$plusCodeFull';
  static String get osmOwendoUrl => 'https://www.openstreetmap.org/?mlat=${owendoLatLng.latitude}&mlon=${owendoLatLng.longitude}#map=15/${owendoLatLng.latitude}/${owendoLatLng.longitude}';

  static String get displayCoords => '${plusCodeLatLng.latitude.toStringAsFixed(5)}° N, ${plusCodeLatLng.longitude.toStringAsFixed(5)}° E';
  static String get displayPlusCode => '$plusCodeShort — $locality, $country';
}
