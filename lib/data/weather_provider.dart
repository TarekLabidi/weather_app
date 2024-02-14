import 'package:flutter/material.dart';
import 'package:weather_app/data/api.dart';

class WeatherProvider extends ChangeNotifier {
  double degree = 0;
  String desc = '';
  double highest = 0;
  double lowest = 0;
  int currentPage = 1;

  void changePage(int index) {
    currentPage = index;
    notifyListeners();
  }

  void homePageVars(WeatherData data) {
    degree = data.degree;
    desc = data.desc;
    highest = data.highest;
    lowest = data.lowest;
    notifyListeners();
  }

  String getBackground() {
    if (desc == 'few clouds' ||
        desc == "broken clouds" ||
        desc == 'scattered clouds') {
      return 'assets/images/brokenclouds.png';
    } else if (desc == "overcast clouds" || desc == "light rain") {
      return 'assets/images/rain.png';
    } else {
      return 'assets/images/stars.png';
    }
  }
}
