// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter13/utils/weather.dart';

class MainScreen extends StatefulWidget {
  final WeatherData weatherData;
  const MainScreen(this.weatherData);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int tempeture;
  late Icon weatherDisplayIcon;
  late AssetImage backgroundImage;
  late String city;
  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      tempeture = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
      city = weatherData.city;
    });
  }

  @override
  void initState() {
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '$tempeture°',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 100.0,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '$city',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
