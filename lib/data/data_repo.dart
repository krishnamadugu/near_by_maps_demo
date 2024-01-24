import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../model/business_near_by.dart';
import 'data_provider.dart';

class MapRepository {
  Future<BusinessNearBy> getNearByPlaces(
      MapDataProvider mapDataProvider) async {
    try {
      final data = await mapDataProvider.nearByPlaces();
      final jsonData = json.decode(data);
      final res = BusinessNearBy.fromJson(jsonData);
      debugPrint(res.toString());
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
