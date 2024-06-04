import 'package:geolocator/geolocator.dart';

class CurrentLocation {
  double? latitude;
  double? longitude;
  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    } catch (e) {
      print('位置情報の取得に失敗しました');
    }
  }
}
