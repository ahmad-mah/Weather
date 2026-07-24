import 'package:geolocator/geolocator.dart';

extension LocationFormat on Position {
  String get formattedLocation => '$latitude,$longitude';
}
