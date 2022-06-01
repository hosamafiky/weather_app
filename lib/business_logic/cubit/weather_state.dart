part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherDataLoading extends WeatherState {}

class WeatherDataLoaded extends WeatherState {
  final WeatherForecast weatherForecast;

  WeatherDataLoaded(this.weatherForecast);
}
