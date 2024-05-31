import 'package:flutter/material.dart';
import 'package:geolocator_sample/current_time.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOKYO'),
      ),
      body: const Column(
        children: [
          CurrentTime(),
          Text('天気'),
          Text('湿度'),
          Text('風速'),
          Text('風向き'),
          Text('気温'),
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: Colors.black,
              size: 40,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 40,
            ),
            label: ''),
      ]),
    );
  }
}
