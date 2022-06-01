import 'package:another_weather_app/data/models/weather_forecast.dart';
import 'package:another_weather_app/data/repository/weather_app_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  final WeatherRepository weatherRepository;

  static WeatherCubit get(BuildContext context) => BlocProvider.of(context);

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  WeatherForecast? weatherForecast;

  void getDataForecast(String cityName) async {
    emit(WeatherDataLoading());
    if (cityName.isEmpty) {
      final position = await _determinePosition();
      weatherRepository
          .getWeatherForecastBasedOnLocation(
        position.latitude,
        position.longitude,
      )
          .then((model) {
        weatherForecast = model;
        //print(weatherForecast!.days![0].hours!.length);

        emit(WeatherDataLoaded(model));
      });
    } else {
      weatherRepository.getWeatherForecast(cityName).then((model) {
        weatherForecast = model;
        print(weatherForecast!.days![0].hours!.length);
        emit(WeatherDataLoaded(model));
      });
    }
  }
}
