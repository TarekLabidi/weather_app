import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/mobileView/vertical_layout/local_weather.dart';
import 'package:weather_app/mobileView/vertical_layout/other_weather.dart';
import 'package:weather_app/weather_provider.dart';

class MobileVericalLayoutHomePage extends StatefulWidget {
  const MobileVericalLayoutHomePage({super.key});

  @override
  State<MobileVericalLayoutHomePage> createState() =>
      _MobileVericalLayoutHomePageState();
}

class _MobileVericalLayoutHomePageState
    extends State<MobileVericalLayoutHomePage> {
  List<Widget> pages = [const LocalWeather(), const OtherWeathers()];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[context.watch<WeatherProvider>().currentPage],
    );
  }
}
