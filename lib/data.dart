import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherData extends ChangeNotifier {}

Future getCurrentWeather() async {
  try {
    const apiKey = '69fa17bd7ec7b060c3ccd21d5d9307b6';
    const city = 'Monastir,TN';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$city,uk&APPID=$apiKey');
    final res = await http.get(url);
    if (jsonDecode(res.body)['cod'] == '200') {
      return jsonDecode(res.body);
    } else {
      throw ('an error has occured');
    }
  } catch (e) {
    throw (e);
  }
}
