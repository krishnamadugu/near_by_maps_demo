//final apiKey = 'AIzaSyAsZp1ThneAJW0DZIFX6vDPVeVOIqdC5XQ';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final apiKey = 'AIzaSyBnCy4Fo2VA02RpgIUQxaxU-ZNpr8D553Y';
final apiUrl = 'https://places.googleapis.com/v1/places:searchNearby';

Connectivity connectivity = Connectivity();
const LatLng center = const LatLng(35.08549, -89.75537);
