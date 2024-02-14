import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  double temp = 0;
  void setTemp(double newTemp) {
    temp = newTemp;
    notifyListeners();
  }
}
