import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/api.dart';
import 'package:weather_app/components/bottom_informations_sheet.dart';
import 'package:weather_app/components/text_widget.dart';

class VerticalLayout extends StatefulWidget {
  const VerticalLayout({super.key});

  @override
  State<VerticalLayout> createState() => _VerticalLayoutState();
}

class _VerticalLayoutState extends State<VerticalLayout> {
  late double degree = 0;
  late String desc = '';
  late double highest = 0;
  late double lowest = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeWeatherData();
  }

  Future<void> initializeWeatherData() async {
    try {
      final res = await WeatherApi.getCurrentWeather('Monastir,TN');
      final weatherData = WeatherApi.extractWeatherData(res);

      setState(() {
        degree = weatherData.degree;
        desc = weatherData.desc;
        highest = weatherData.highest;
        lowest = weatherData.lowest;
        isLoading = false;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return (isLoading == false)
        ? Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/stars.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/house.png',
                        height: height * 0.55,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.1),
                    Center(
                      child: TextWidget(
                        width: width,
                        degree: degree,
                        highest: highest,
                        lowest: lowest,
                        desc: desc,
                      ),
                    ),
                    const Spacer(),
                    const BottomInformationsSheet(),
                  ],
                )
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
