import 'package:another_weather_app/constants/palette.dart';
import 'package:another_weather_app/constants/strings.dart';
import 'package:another_weather_app/data/models/weather_forecast.dart';
import 'package:another_weather_app/presentation/widgets/weather_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen(
      {Key? key,
      required this.daysList,
      required this.selectedIndex,
      required this.location})
      : super(key: key);

  final List<Days> daysList;
  final int selectedIndex;
  final String location;

  final ItemScrollController scrollController = ItemScrollController();

  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  String generateImageName(String text) {
    if (text.contains('Rain')) {
      return 'rain';
    } else {
      return text.replaceAll(' ', '').toLowerCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int currentTimeIndex = 0;
    return Scaffold(
      backgroundColor: Palette.secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette.secondaryColor,
        elevation: 0.0,
        title: Text(location),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, welcomeRoute),
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 10.0,
            child: SizedBox(
              height: 120.0,
              width: size.width,
              child: ScrollablePositionedList.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemScrollController: scrollController,
                itemPositionsListener: itemPositionsListener,
                initialScrollIndex: selectedIndex >= 2 ? selectedIndex - 2 : 0,
                initialAlignment: 0,
                itemBuilder: (context, index) {
                  var weatherItemDate = daysList[index].datetime;
                  var futueWeatherState = daysList[index].conditions;
                  var weatherUrl = generateImageName(futueWeatherState!);
                  var parsedDate = DateTime.parse(weatherItemDate!);
                  var newDate =
                      DateFormat('EEEE').format(parsedDate).substring(0, 3);
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    width: 80.0,
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? Colors.white
                          : const Color(0xFF9EBCF9),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5.0,
                          color: Colors.blue.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${daysList[index].temp.round()}C',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                            color: index == selectedIndex
                                ? Colors.blue
                                : Colors.white,
                          ),
                        ),
                        Image.asset(
                          'assets/$weatherUrl.png',
                          width: 30.0,
                        ),
                        Text(
                          newDate,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                            color: index == selectedIndex
                                ? Colors.blue
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 20.0);
                },
                itemCount: daysList.length,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              height: size.height * 0.55,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50.0),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50.0,
                    left: 10.0,
                    right: 10.0,
                    child: Container(
                      width: size.width * 0.8,
                      height: 300.0,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.center,
                          colors: [
                            Color(0xFFa9c1f5),
                            Color(0xFF6696f5),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 25),
                            color: Colors.blue.withOpacity(0.1),
                            blurRadius: 3.0,
                            spreadRadius: -10.0,
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
                              'assets/${generateImageName(daysList[selectedIndex].conditions!)}.png',
                              width: 120.0,
                            ),
                          ),
                          Positioned(
                            top: 130.0,
                            left: 30.0,
                            child: Text(
                              daysList[selectedIndex].conditions!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 10.0,
                            right: 10.0,
                            child: Container(
                              width: size.width * 0.8,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WeatherItem(
                                    title: 'Wind Speed',
                                    value: daysList[selectedIndex].windspeed!,
                                    imageUrl: 'assets/windspeed.png',
                                    unit: 'km/h',
                                    color: Colors.white,
                                  ),
                                  WeatherItem(
                                    title: 'Humidity',
                                    value: daysList[selectedIndex].humidity!,
                                    imageUrl: 'assets/humidity.png',
                                    unit: '',
                                    color: Colors.white,
                                  ),
                                  WeatherItem(
                                    title: 'Max. Temp.',
                                    value:
                                        daysList[selectedIndex].tempmax.round(),
                                    imageUrl: 'assets/max-temp.png',
                                    unit: 'C',
                                    color: Colors.white,
                                  ),
                                ],
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
                                    daysList[selectedIndex]
                                        .temp!
                                        .round()
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 80.0,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..shader = Palette.shader,
                                    ),
                                  ),
                                ),
                                Text(
                                  'o',
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = Palette.shader,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 255.0,
                    child: SizedBox(
                      height: 120.0,
                      width: size.width,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          DateTime dayHour = DateTime.parse(
                              '${daysList[selectedIndex].datetime!} ${daysList[selectedIndex].hours![index].datetime}');
                          String thisHour =
                              DateTime.now().toString().substring(11);
                          DateTime day = DateTime.parse(
                              '${daysList[selectedIndex].datetime!} $thisHour');
                          String formattedNowTime = DateFormat.j().format(day);
                          String formattedDayTime =
                              DateFormat.j().format(dayHour);
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: formattedNowTime == formattedDayTime
                                  ? Palette.primaryColor
                                  : Colors.white,
                              border: Border.all(
                                color: Palette.primaryColor.withOpacity(0.7),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 3),
                                  color:
                                      Palette.secondaryColor.withOpacity(0.1),
                                  blurRadius: 15.0,
                                  spreadRadius: 5.0,
                                ),
                              ],
                            ),
                            height: double.infinity,
                            width: 80.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${daysList[selectedIndex].hours![index].temp!.round().toString()} C',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: formattedNowTime == formattedDayTime
                                        ? Colors.white
                                        : Palette.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset(
                                  'assets/${generateImageName(daysList[selectedIndex].hours![index].conditions!)}.png',
                                  width: 30.0,
                                ),
                                Text(
                                  formattedDayTime,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: formattedNowTime == formattedDayTime
                                        ? Colors.white
                                        : Palette.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 20.0);
                        },
                        itemCount: daysList[selectedIndex].hours!.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
