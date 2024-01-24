import 'dart:convert';

import 'package:demo_maps/app_constants.dart';
import 'package:http/http.dart' as http;

class MapDataProvider {
  Future<String> nearByPlaces() async {
    Map<String, String> headerOptions = {
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask':
          'places.displayName,places.formattedAddress,places.types,places.websiteUri,places.location,places.internationalPhoneNumber',
    };
    Map<String, dynamic> body = {
      "includedTypes": ["farm"],
      "maxResultCount": 20,
      "locationRestriction": {
        "circle": {
          "center": {
            "latitude": center.latitude,
            "longitude": center.longitude
          },
          "radius": 5000.0
        }
      }
    };
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headerOptions,
        body: jsonEncode(body),
      );
      return response.body.toString();
    } catch (e) {
      rethrow;
    }
  }
}
