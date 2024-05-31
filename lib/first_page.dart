import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOKYO'),
      ),
      body: Column(
        children: [
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
