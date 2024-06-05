import 'package:geolocator_sample/services/current_location.dart';
import 'package:geolocator_sample/services/network_helper.dart';

String apiKey = 'faca477592cf21c0f3627e68fc1fd1b0';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    CurrentLocation currentLocation = CurrentLocation();
    await currentLocation.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=$apiKey&units=metric&lang=ja');

    dynamic weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherId(int id) {
    if (id == 800) {
      return '快晴';
    } else if (id >= 801) {
      return '晴れ';
    } else if (id >= 803) {
      return '曇り';
    } else if (id >= 600) {
      return '雪';
    } else if (id >= 500) {
      return '雨';
    } else if (id >= 503) {
      return '大雨';
    } else if (id >= 300) {
      return '霧雨';
    } else if (id >= 200) {
      return '雷雨';
    } else {
      return 'error';
    }
  }
}
