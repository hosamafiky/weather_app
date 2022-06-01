import 'dart:developer';

import 'package:another_weather_app/constants/strings.dart';
import 'package:dio/dio.dart';

class WeatherWebServices {
  late Dio dio;

  WeatherWebServices() {
    final options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
      sendTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>?> getWeatherForecast(String cityName) async {
    return await dio.get(
      'timeline/$cityName/${DateTime.now().toString().substring(0, 10)}/${DateTime.now().add(const Duration(days: 15)).toString().substring(0, 10)}',
      queryParameters: {
        'key': appId,
        'include': 'days,hours',
        'unitGroup': 'metric',
        'contentType': 'json',
      },
    ).then((value) {
      return value.data;
    }).catchError((error) {
      log(error.toString());
    });
  }

  Future<Map<String, dynamic>?> getWeatherForecastBasedOnLocation(
    double lat,
    double lon,
  ) async {
    return await dio.get(
      'timeline/$lat,$lon',
      queryParameters: {
        'key': appId,
        'include': 'days,hours',
        'unitGroup': 'metric',
        'contentType': 'json',
      },
    ).then((value) {
      return value.data;
    }).catchError((error) {
      log(error.toString());
    });
  }
}
