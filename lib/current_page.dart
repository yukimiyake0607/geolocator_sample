import 'package:flutter/material.dart';
import 'current_time.dart';

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
        CurrentTime(),
        Text('天気'),
        Text('湿度'),
        Text('風速'),
        Text('風向き'),
        Text('気温'),
      ],
    );
  }
}
