import 'package:flutter/material.dart';
import 'package:flutter13/screens/loading_screen.dart';
// import 'package:flutter13/screens/main_screen.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'WeatherService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
