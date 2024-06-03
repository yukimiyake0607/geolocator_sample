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
    return Column(
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
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '湿度',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '90%',
                    style: TextStyle(fontSize: 40),
                  ),
                  Spacer(),
                  Text('湿度は高めです'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        )),
        Row(
          children: [
            Text('湿度'),
            Text('風速'),
            Text('風向き'),
            Text('日の出'),
            Text('日の入り'),
            Text('体感温度'),
          ],
        ),
      ],
    );
  }
}

class BuildWeatherInfo extends StatefulWidget {
  String title;
  int value;
  String description;
  String parameter;

  BuildWeatherInfo({
    Key? key,
    required this.title,
    required this.value,
    required this.description,
    required this.parameter,
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
            widget.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                widget.value.toString(),
                style: TextStyle(fontSize: 40),
              ),
              Text(widget.parameter),
            ],
          ),
          Spacer(),
          Text(widget.description),
        ],
      ),
    );
  }
}
