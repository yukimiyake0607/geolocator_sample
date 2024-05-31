import 'package:flutter/material.dart';
import 'package:geolocator_sample/search_location.dart';
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
      appBar: AppBar(
        title: const Text('TOKYO'),
      ),
      body: IndexedStack(
        index: _selectedScreen,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: Colors.black,
              size: 40,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 40,
              ),
              label: ''),
        ],
        currentIndex: 0,
        onTap: _ontap,
      ),
    );
  }
}


