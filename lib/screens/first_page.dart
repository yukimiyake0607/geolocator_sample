import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator_sample/services/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import '../services/build_weather_info.dart';
import '../services/current_time.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.weatherData});
  final weatherData;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String cityName = '';
  double temperture = 0;
  double highTemperture = 0;
  double lowTemperture = 0;
  String weatherName = '';
  IconData weatherIcon = WeatherIcons.day_sunny;
  int humidity = 0;
  double sensibleTemperture = 0;
  double windSpeed = 0;
  String windDirection = '';
  String localSunsetTime = '';
  String localSunriseTime = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    WeatherModel weather = WeatherModel();

    //日の出時間を出力
    final utcSunsetTime = weatherData['sys']['sunset'];

    //日の入時間を出力
    final utcSunriseTime = weatherData['sys']['sunrise'];
    if (weatherData == null) {
      cityName = 'ERROR';
      temperture = 0;
      highTemperture = 0;
      lowTemperture = 0;
      weatherName = '取得できませんでした';
      weatherIcon = WeatherIcons.alien;
      humidity = 0;
      sensibleTemperture = 0;
      windSpeed = 0;
      windDirection = '不明';
      localSunsetTime = '不明';
      localSunriseTime = '不明';
      return;
    }
    cityName = weatherData['name'];
    temperture = weatherData['main']['temp'];
    highTemperture = weatherData['main']['temp_max'];
    lowTemperture = weatherData['main']['temp_min'];
    weatherName = weather.getWeatherId(weatherData['weather'][0]['id']);
    weatherIcon = weather.getWeatherIcon(weatherData['weather'][0]['id']);
    humidity = weatherData['main']['humidity'];
    sensibleTemperture = weatherData['main']['feels_like'];
    windSpeed = weatherData['wind']['speed'];
    windDirection = weather.getWindDirection(weatherData['wind']['deg']);
    localSunsetTime =
        weather.formatLocalTimeFromUTC(utcSunsetTime); // すでにクラス内で宣言された変数を更新する
    localSunriseTime = weather.formatLocalTimeFromUTC(utcSunriseTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // AppBarを背景の上に配置
      extendBody: true, // BottomNavigationBarを背景の上に配置
      appBar: AppBar(
        title: Text(
          cityName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent, // AppBarを透明に
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/weather_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    weatherName,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(
                                      weatherIcon,
                                      size: 90,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CurrentTime(),
                                      Text(
                                        '時点',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '${temperture.toInt().toString()}℃',
                              style: TextStyle(fontSize: 50),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '最高:${highTemperture.toInt().toString()}℃'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('最低:${lowTemperture.toInt().toString()}℃'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        BuildWeatherInfo(
                            title: '湿度',
                            value: humidity,
                            description: '湿度は高めです',
                            parameter: '%'),
                        BuildWeatherInfo(
                            title: '体感温度',
                            value: sensibleTemperture.toInt(),
                            description: '半袖で過ごせます',
                            parameter: '℃'),
                        BuildWeatherInfo(
                            title: '風速',
                            value: windSpeed.toInt(),
                            description: '時折少し強い風が吹きます',
                            parameter: 'm/s'),
                        BuildWeatherInfo(
                          title: '風向き',
                          value: windDirection,
                        ),
                        BuildWeatherInfo(
                          title: '日の出',
                          value: localSunsetTime,
                          parameter: '時',
                        ),
                        BuildWeatherInfo(
                          title: '日の入',
                          value: localSunsetTime,
                          parameter: '時',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
