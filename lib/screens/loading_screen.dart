//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter13/screens/main_screen.dart';
import 'package:flutter13/utils/location.dart';
import 'package:flutter13/utils/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
//  const TextLearnView({Key? key}) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(child: Text('veli')),
  //   );

  // return const Scaffold(
  //   body: Center(child: Text('veli'))),
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationHelper locationData;
  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData.getCurrentLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      print('konum bulunamadı');
    } else {
      print('latitude: ' + locationData.latitude.toString());
      print('longitude: ' + locationData.longitude.toString());
    }
  }

  void getWeatherData() async {
    await getLocationData();
    WeatherData weatherData = WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();

    if (weatherData.currentTemperature == null ||
        weatherData.currentCondition == null) {
      print('api sıcaklık veya durum değeri vermiyo');
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MainScreen(weatherData);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              const Color.fromARGB(255, 138, 245, 142),
              Color.fromARGB(255, 247, 26, 10)
            ])),
        child: Center(
          child: SpinKitThreeInOut(
            color: Colors.white,
            size: 150,
            duration: Duration(milliseconds: 1200),
          ),
        ),
      ),
    );
  }
}
