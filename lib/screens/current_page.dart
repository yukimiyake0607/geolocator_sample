import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return const Column(
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
                          '快晴',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text('最高:20℃'),
                      Text('最低:10℃'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Text('湿度'),
        Text('風速'),
        Text('風向き'),
        Text('日の出'),
        Text('日の入り'),
      ],
    );
  }
}
