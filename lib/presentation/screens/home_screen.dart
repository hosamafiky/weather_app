import 'package:another_weather_app/business_logic/cubit/weather_cubit.dart';
import 'package:another_weather_app/constants/palette.dart';
import 'package:another_weather_app/data/models/city.dart';
import 'package:another_weather_app/presentation/screens/details_screen.dart';
import 'package:another_weather_app/presentation/widgets/weather_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  String location = 'Cairo';
  List<String> cities = ['Cairo'];
  final selectedCities = City.getSelectedCities();
  @override
  void initState() {
    for (var element in selectedCities) {
      cities.add(element.city);
    }
    super.initState();
  }

  Widget buildBlocWidget(state, Size size) {
    if (state is WeatherDataLoaded) {
      var model = state.weatherForecast;
      String weatherState = model.days!.first.conditions!;
      String generateImageName(String text) {
        if (text.contains('Rain')) {
          return 'rain';
        } else {
          return text.replaceAll(' ', '').toLowerCase();
        }
      }

      String imageUrl = generateImageName(weatherState);

      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.address!.contains(RegExp(r'[0-9]'))
                      ? capitalize(model.timezone!)
                          .split('/')[1]
                          .replaceAll('_', '')
                      : capitalize(model.address!),
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat.MMMMEEEEd()
                      .format(DateTime.parse(model.days!.first.datetime!)),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 50.0),
                Container(
                  height: 200.0,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Palette.primaryColor,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.primaryColor.withOpacity(0.5),
                        offset: const Offset(0, 25),
                        blurRadius: 10.0,
                        spreadRadius: -12.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -40.0,
                        left: 20.0,
                        child: Image.asset(
                          'assets/${imageUrl.toLowerCase()}.png',
                          width: 150.0,
                        ),
                      ),
                      Positioned(
                        bottom: 30.0,
                        left: 20.0,
                        child: Text(
                          model.days!.first.conditions!,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20.0,
                        right: 20.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                model.days!.first.temp!.round().toString(),
                                style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()..shader = Palette.shader,
                                ),
                              ),
                            ),
                            Text(
                              'o',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = Palette.shader,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherItem(
                        title: 'Wind Speed',
                        value: model.days!.first.windspeed!,
                        imageUrl: 'assets/windspeed.png',
                        unit: 'km/h',
                      ),
                      WeatherItem(
                        title: 'Humidity',
                        value: model.days!.first.humidity!,
                        imageUrl: 'assets/humidity.png',
                        unit: '',
                      ),
                      WeatherItem(
                        title: 'Max. Temperature',
                        value: model.days!.first.tempmax.round(),
                        imageUrl: 'assets/max-temp.png',
                        unit: 'C',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Next 15 days',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Palette.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150.0,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20.0);
              },
              itemBuilder: (context, index) {
                String today = DateTime.now().toString().substring(0, 10);
                var weatherItemDate = model.days![index].datetime;
                var futueWeatherState = model.days![index].conditions;
                var weatherUrl = generateImageName(futueWeatherState!);
                var parsedDate = DateTime.parse(weatherItemDate!);
                var newDate =
                    DateFormat('EEEE').format(parsedDate).substring(0, 3);
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        daysList: model.days!,
                        selectedIndex: index,
                        location: model.address!.contains(RegExp(r'[0-9]'))
                            ? capitalize(model.timezone!)
                                .split('/')[1]
                                .replaceAll('_', '')
                            : capitalize(model.address!),
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    width: 80.0,
                    decoration: BoxDecoration(
                      color: today == weatherItemDate
                          ? Palette.primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5.0,
                          color: today == weatherItemDate
                              ? Palette.primaryColor
                              : Colors.black54.withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${model.days![index].temp.round()} C',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: today == weatherItemDate
                                ? Colors.white
                                : Palette.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Image.asset(
                          'assets/$weatherUrl.png',
                          width: 30.0,
                        ),
                        Text(
                          newDate,
                          style: TextStyle(
                            color: today == weatherItemDate
                                ? Colors.white
                                : Palette.primaryColor,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: model.days!.length,
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/profile.jpg',
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/pin.png',
                        width: 20.0,
                      ),
                      const SizedBox(width: 5.0),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: location,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: cities
                                .map(
                                  (String location) => DropdownMenuItem(
                                    value: location,
                                    child: Text(
                                      location,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? value) {
                              setState(() {
                                location = value!;
                                cubit.getDataForecast(location);
                              });
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: buildBlocWidget(state, size),
            ),
          ),
        );
      },
    );
  }
}
