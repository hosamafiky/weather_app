import 'package:another_weather_app/constants/palette.dart';
import 'package:another_weather_app/constants/strings.dart';
import 'package:another_weather_app/data/models/city.dart';
import 'package:another_weather_app/presentation/widgets/city_card.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<City> cities =
        City.citiesList.where((city) => city.isDefault == false).toList();
    List<City> selectedCities = City.getSelectedCities();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette.primaryColor,
        automaticallyImplyLeading: false,
        title: Text('${selectedCities.length.toString()} Selected'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CityCard(
            size: size,
            city: cities[index],
            onTap: () {
              setState(() {
                cities[index].isSelected = !cities[index].isSelected;
              });
            },
          );
        },
        itemCount: cities.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.primaryColor,
        child: const Icon(Icons.pin_drop),
        onPressed: () => Navigator.pushNamed(
          context,
          homeRoute,
        ),
      ),
    );
  }
}
