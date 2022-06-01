import 'package:another_weather_app/constants/palette.dart';
import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  WeatherItem({
    Key? key,
    required this.value,
    required this.title,
    required this.imageUrl,
    required this.unit,
    this.color = Colors.black,
  }) : super(key: key);

  final dynamic value;
  final String title;
  final String imageUrl;
  final String unit;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Palette.kGreyColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Image.asset(imageUrl),
        ),
        const SizedBox(height: 8.0),
        Text(
          '${value.toString()} $unit',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
