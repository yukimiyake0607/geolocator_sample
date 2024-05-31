import 'package:flutter/material.dart';
import 'package:geolocator_sample/current_location.dart';
import 'package:geolocator_sample/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
