import 'package:geolocator_sample/services/current_location.dart';
import 'package:geolocator_sample/services/network_helper.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    CurrentLocation currentLocation = CurrentLocation();
    await currentLocation.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=faca477592cf21c0f3627e68fc1fd1b0&units=metric');

    dynamic weatherData = await networkHelper.getData();
    return weatherData;
  }
}
