import 'package:another_weather_app/app_router.dart';
import 'package:another_weather_app/business_logic/cubit/weather_cubit.dart';
import 'package:another_weather_app/business_logic/observer.dart';
import 'package:another_weather_app/data/repository/weather_app_repository.dart';
import 'package:another_weather_app/data/web_services/weather_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (_) => WeatherCubit(
        WeatherRepository(
          WeatherWebServices(),
        ),
      )..getDataForecast(''),
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
