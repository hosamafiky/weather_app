import 'package:another_weather_app/constants/palette.dart';
import 'package:another_weather_app/constants/strings.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Palette.primaryColor.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/get-started.png'),
            const SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  welcomeRoute,
                );
              },
              child: Container(
                height: 50.0,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  color: Palette.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
