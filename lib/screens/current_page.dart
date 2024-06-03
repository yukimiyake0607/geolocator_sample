import 'package:flutter/material.dart';
import '../services/current_time.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({super.key});

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                                fontSize: 18, fontWeight: FontWeight.bold),
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
    );
  }
}

class BuildWeatherInfo extends StatefulWidget {
  String? title;
  int? value;
  String? description;
  String? parameter;

  BuildWeatherInfo({
    Key? key,
    this.title,
    this.value,
    this.description,
    this.parameter,
  }) : super(key: key);

  @override
  State<BuildWeatherInfo> createState() => _BuildWeatherInfoState();
}

class _BuildWeatherInfoState extends State<BuildWeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title ?? '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                widget.value.toString(),
                style: TextStyle(fontSize: 40),
              ),
              Text(widget.parameter ?? ''),
            ],
          ),
          Spacer(),
          Text(widget.description ?? ''),
        ],
      ),
    );
  }
}
