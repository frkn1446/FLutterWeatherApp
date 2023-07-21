import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'location.dart';

class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage});
}

class WeatherData {
  late LocationHelper locationData;
  late double currentTemperature;
  late int currentCondition;
  late String city;
  String apiKey = 'd6eaa7bf2024612e7c0bec700ca8d9ea';

  WeatherData({required this.locationData});

  Future<void> getCurrentTemperature() async {
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        city = currentWeather['name'];
      } catch (e) {
        print(e);
      }
    } else
      print('apiden değer gelmiyor');
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 600) {
      //hava bulutlu
      return WeatherDisplayData(
          weatherIcon:
              Icon(FontAwesomeIcons.cloud, size: 75.0, color: Colors.white),
          weatherImage: AssetImage('assets/bulutlu.png'));
    } else {
      //hava iyi
      //gece gündüz kontrolü
      var now = new DateTime.now();
      if (now.hour >= 19) {
        return WeatherDisplayData(
            weatherIcon:
                Icon(FontAwesomeIcons.moon, size: 75.0, color: Colors.white),
            weatherImage: AssetImage('assets/gece.png'));
      } else {
        return WeatherDisplayData(
            weatherIcon:
                Icon(FontAwesomeIcons.sun, size: 75.0, color: Colors.black),
            weatherImage: AssetImage('assets/gunesli.png'));
      }
    }
  }
}
