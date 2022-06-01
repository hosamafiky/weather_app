import 'package:another_weather_app/data/models/weather_forecast.dart';
import 'package:another_weather_app/data/web_services/weather_web_services.dart';

class WeatherRepository {
  final WeatherWebServices weatherWebServices;

  WeatherRepository(this.weatherWebServices);

  Future<WeatherForecast> getWeatherForecast(String cityName) async {
    final model = await weatherWebServices.getWeatherForecast(cityName);
    return WeatherForecast.fromJson(model!);
  }

  Future<WeatherForecast> getWeatherForecastBasedOnLocation(
    double lat,
    double lon,
  ) async {
    final model =
        await weatherWebServices.getWeatherForecastBasedOnLocation(lat, lon);
    return WeatherForecast.fromJson(model!);
  }
}
