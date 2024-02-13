import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/Views/mobile_view.dart';
import 'package:weather_app/Views/pc_view.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int temp = 0;

  @override
  void initState() {
    super.initState();
    // Call a separate method to perform asynchronous initialization
    _initializeWeatherData();
    print('object');
  }

  Future<void> _initializeWeatherData() async {
    print('dddd');
    try {
      final res = await getCurrentWeather();
      print(res);
      // Update state with the fetched data, for example:
      // setState(() {
      //   temp = res['main']['temp'];
      // });
    } catch (e) {
      print('An error occurred while fetching weather data: $e');
      // Handle error accordingly
    }
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      print('entred');
      const apiKey = '69fa17bd7ec7b060c3ccd21d5d9307b6';
      const city = 'Monastir,TN';
      print('res');
      final url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city,uk&APPID=$apiKey');
      final res = await http.get(url);
      print('res');
      if (res.statusCode == 200) {
        print('200');
        return jsonDecode(res.body);
      } else {
        print('error');
        throw ('');
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Making sure the app look good on all resolutions
    if (MediaQuery.of(context).size.width < 650 ||
        MediaQuery.of(context).size.height < 500) {
      return const BuildMobileView();
    } else {
      return const BuildPcView();
    }
  }
}
