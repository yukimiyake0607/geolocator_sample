import 'package:flutter/material.dart';
import 'package:geolocator_sample/screens/search_location.dart';
import 'current_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedScreen = 0;

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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // AppBarを背景の上に配置
      extendBody: true, // BottomNavigationBarを背景の上に配置
      appBar: AppBar(
        title: const Text('TOKYO',
        style: TextStyle(color: Colors.white),),
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
            child: IndexedStack(
              index: _selectedScreen,
              children: screens,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent, // BottomNavigationBarを透明に
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: Colors.white,
              size: 40,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 40,
              ),
              label: ''),
        ],
        currentIndex: _selectedScreen,
        onTap: _ontap,
      ),
    );
  }
}
