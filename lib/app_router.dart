import 'package:another_weather_app/business_logic/cubit/weather_cubit.dart';
import 'package:another_weather_app/constants/strings.dart';
import 'package:another_weather_app/data/repository/weather_app_repository.dart';
import 'package:another_weather_app/data/web_services/weather_web_services.dart';
import 'package:another_weather_app/presentation/screens/get_started.dart';
import 'package:another_weather_app/presentation/screens/home_screen.dart';
import 'package:another_weather_app/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  late WeatherRepository weatherRepository;
  late WeatherCubit weatherCubit;

  AppRouter() {
    weatherRepository = WeatherRepository(WeatherWebServices());
    weatherCubit = WeatherCubit(weatherRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case getStartedRoute:
        return MaterialPageRoute(
          builder: (context) => const GetStarted(),
        );
      case welcomeRoute:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
    return null;
  }
}
