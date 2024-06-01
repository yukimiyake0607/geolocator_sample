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
      children: [
        Align(
          alignment: Alignment.center,
          child: CurrentTime(),
        ),
        Icon(
          WeatherIcons.day_sunny,
          size: 50,
          color: Colors.yellow,
        ),
        Text('天気'),
        Text('湿度'),
        Text('風速'),
        Text('風向き'),
        Text('気温'),
      ],
    );
  }
}
