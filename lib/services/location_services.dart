import 'dart:convert';

import 'package:flutter_app_demo/models/location.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class LocationServices {
  static Future<List<Location>> fetchLocations() async {
    List<Location> locationList = [];
    try {
      Response response = await http.get(Uri.parse(
          'https://www.tcs.com/content/dam/global-tcs/en/worldwide-json/worldwide-map-5-12.json'));
      dynamic jsonAppData = json.decode(response.body);
      dynamic locationData = jsonAppData['locations'];
      if (jsonAppData != null && locationData != null) {
        locationList = locationData
            .map<Location>((dynamic json) => Location.fromJson(json))
            .toList();
        return locationList;
      }
    } catch (e) {
      throw Exception("Location Fetch Failed$e");
    }
    return locationList;
  }
}
