import 'dart:async';

import 'package:flutter/material.dart';

class CurrentTime extends StatefulWidget {
  const CurrentTime({Key? key}) : super(key: key);

  @override
  State<CurrentTime> createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  late String _timeString;
  late Timer _timer;

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timeString = formatDateTime(DateTime.now());
    _timer = Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      _getTime();
    });
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: const TextStyle(fontSize: 20, color: Colors.white),
    );
  }
}
