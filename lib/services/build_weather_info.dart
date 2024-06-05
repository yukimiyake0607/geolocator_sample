import 'package:flutter/material.dart';

class BuildWeatherInfo extends StatefulWidget {
  String? title;
  final value;
  String? description;
  String? parameter;

  BuildWeatherInfo({
    Key? key,
    this.title,
    this.value,
    this.description,
    this.parameter,
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
            widget.title ?? '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                widget.value.toString(),
                style: TextStyle(fontSize: 40),
              ),
              Text(widget.parameter ?? ''),
            ],
          ),
          Spacer(),
          Text(widget.description ?? ''),
        ],
      ),
    );
  }
}
