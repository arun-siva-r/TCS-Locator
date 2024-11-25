import 'package:flutter_app_demo/models/location.dart';

class Helper {
  static List<String> getCountryNames(List<Location> locations) {
    return locations.map((location) => location.geo!).toSet().toList();
  }
}
