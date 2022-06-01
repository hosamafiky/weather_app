import 'package:another_weather_app/constants/palette.dart';
import 'package:another_weather_app/data/models/city.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    Key? key,
    required this.city,
    required this.size,
    this.onTap,
  }) : super(key: key);

  final City city;
  final Size size;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        top: 20.0,
        right: 10.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: size.height * 0.08,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: city.isSelected
            ? Border.all(
                color: Palette.secondaryColor.withOpacity(0.6),
                width: 2.0,
              )
            : Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: Palette.primaryColor.withOpacity(0.2),
            spreadRadius: 5.0,
            blurRadius: 7.0,
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: Image.asset(
              city.isSelected ? 'assets/checked.png' : 'assets/unchecked.png',
              width: 30.0,
              height: 30.0,
            ),
          ),
          const SizedBox(width: 10.0),
          Text(
            city.city,
            style: TextStyle(
              fontSize: 16.0,
              color: city.isSelected ? Palette.primaryColor : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
