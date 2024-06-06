import 'package:flutter/material.dart';
import 'package:geolocator_sample/services/current_location.dart';
import 'package:geolocator_sample/services/network_helper.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:intl/intl.dart';

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
      return '曇りのち晴れ';
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

  IconData getWeatherIcon(int id) {
    if (id == 800) {
      return WeatherIcons.day_sunny;
    } else if (id >= 801) {
      return WeatherIcons.day_cloudy;
    } else if (id >= 803) {
      return WeatherIcons.cloudy;
    } else if (id >= 600) {
      return WeatherIcons.snow;
    } else if (id >= 500) {
      return WeatherIcons.day_rain;
    } else if (id >= 503) {
      return WeatherIcons.rain_wind;
    } else if (id >= 300) {
      return WeatherIcons.showers;
    } else if (id >= 200) {
      return WeatherIcons.day_thunderstorm;
    } else {
      return WeatherIcons.alien;
    }
  }

  String getWindDirection(int direction) {
    if (direction == 0) {
      return '北';
    } else if (direction == 90) {
      return '東';
    } else if (direction == 180) {
      return '南';
    } else if (direction == 270) {
      return '西';
    } else if (0 < direction) {
      return '北東';
    } else if (90 < direction) {
      return '南東';
    } else if (180 < direction) {
      return '南西';
    } else if (270 < direction) {
      return '北西';
    } else {
      return '不明';
    }
  }

  String formatLocalTimeFromUTC(int utcTimeString) {
    DateTime utcDateTime =
        DateTime.fromMillisecondsSinceEpoch(utcTimeString * 1000)
            .toLocal(); // UTCからDateTimeオブジェクトに変換し、ローカル時刻に変換する
    String formattedTime =
        DateFormat.Hm().format(utcDateTime); // ○時○分形式にフォーマットする
    return formattedTime; // フォーマットされた時刻を返す
  }

  String humidityText(int humidity) {
    if (humidity > 60) {
      return '湿度高めです。こまめに換気しましょう。';
    } else if (humidity > 40) {
      return '適正な湿度です。';
    } else {
      return '湿度低めです。感染症を起こすリスクが高くなります。';
    }
  }

  String sensitibleTempertureText(double sensitibleTemperture) {
    if (sensitibleTemperture >= 30) {
      return '半袖で過ごせます。';
    } else if (sensitibleTemperture >= 25) {
      return '半袖シャツで過ごせます。';
    } else if (sensitibleTemperture < 25) {
      return '長袖シャツで過ごせます。';
    } else if (sensitibleTemperture < 20) {
      return '薄手のカーディガンを持ち歩きましょう。';
    } else if (sensitibleTemperture < 15) {
      return 'セーターで過ごせます。';
    } else if (sensitibleTemperture < 12) {
      return 'トレンチコートを羽織りましょう。';
    } else {
      return '冬用アウターを羽織りましょう。';
    }
  }

  String windSpeedText(double windSpeed) {
    if (windSpeed < 10.0) {
      return '適正風速です。';
    } else if (windSpeed < 15.0) {
      return 'やや強い風が吹きます。';
    } else if (windSpeed < 20.0) {
      return '強い風が吹きます。';
    } else if (windSpeed < 30.0) {
      return '非常に強い風が吹きます。屋内へ避難しましょう。';
    } else {
      return '猛烈に強い風が吹きます。外出を控えましょう。';
    }
  }
}
