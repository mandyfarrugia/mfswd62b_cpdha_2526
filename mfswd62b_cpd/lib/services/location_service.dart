import 'package:geolocator/geolocator.dart';
import 'package:mfswd62b_cpd/models/asset_location.dart';

class LocationService {
  static Future<AssetLocation> fetchCurrentLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!isServiceEnabled) {
      throw Exception('Location services are currently disabled!');
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();

    if(locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    if(locationPermission == LocationPermission.deniedForever) {
      throw Exception('Location cannot be fetched as permission is permanently disabled!');
    }

    final currentPosition = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high
      )
    );

    return AssetLocation(
      latitude: currentPosition.latitude,
      longitude: currentPosition.longitude
    );
  }
}