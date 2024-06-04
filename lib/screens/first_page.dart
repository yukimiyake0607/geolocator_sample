import 'package:flutter/material.dart';
import 'package:geolocator_sample/screens/search_location.dart';
import 'package:weather_icons/weather_icons.dart';
import '../services/build_weather_info.dart';
import '../services/current_time.dart';
import 'current_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.weatherData});
  final weatherData;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedScreen = 0;
  String cityName = '';

  List<Widget> screens = [
    CurrentPage(),
    SearchLocation(),
  ];

  void _ontap(index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      cityName = 'ERROR';
    }
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
                  const Row(
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
                                    '快晴',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(
                                      WeatherIcons.day_sunny,
                                      size: 90,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  Row(
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
                              '16℃',
                              style: TextStyle(fontSize: 50),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('最高:20℃'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('最低:10℃'),
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
                            value: 90,
                            description: '湿度は高めです',
                            parameter: '%'),
                        BuildWeatherInfo(
                            title: '体感温度',
                            value: 18,
                            description: '半袖で過ごせます',
                            parameter: '℃'),
                        BuildWeatherInfo(
                            title: '風速',
                            value: 5,
                            description: '時折少し強い風が吹きます',
                            parameter: 'm/s'),
                        BuildWeatherInfo(
                          title: '風向き',
                        ),
                        BuildWeatherInfo(
                          title: '日の出',
                          value: 6,
                          parameter: '時',
                        ),
                        BuildWeatherInfo(
                          title: '日の入',
                          value: 17,
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
