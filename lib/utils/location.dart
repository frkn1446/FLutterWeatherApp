import 'package:location/location.dart';

class LocationHelper {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    //Location için servis ayakta mı
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) return;
    }

    //konum izin kont
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted != PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    //izin kontrolü yapıldı
    _locationData = await location.getLocation();

    latitude = _locationData.latitude!;
    longitude = _locationData.longitude!;
  }
}
