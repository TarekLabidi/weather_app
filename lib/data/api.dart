import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherApi {
  static Future<Map<String, dynamic>> getCurrentWeather(String city) async {
    try {
      const apiKey = '69fa17bd7ec7b060c3ccd21d5d9307b6';
      final url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city,uk&APPID=$apiKey');
      final res = await http.get(url);

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        throw ('error');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getCurrentSun(String city) async {
    try {
      const apiKey = '69fa17bd7ec7b060c3ccd21d5d9307b6';
      final url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city,uk&APPID=$apiKey');
      final res = await http.get(url);

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        throw ('error');
      }
    } catch (e) {
      rethrow;
    }
  }

  static WeatherData extractWeatherData(Map<String, dynamic> weatherData) {
    double degree = weatherData['list'][1]['main']['temp'] - 273.15;
    String desc = weatherData['list'][1]['weather'][0]["description"];
    double highest = weatherData['list'][1]['main']['temp_max'] - 273.15;
    double lowest = weatherData['list'][1]['main']['temp_min'] - 273.15;

    return WeatherData(
      degree,
      desc,
      highest,
      lowest,
    );
  }

  static FutureWeatherData extractFutureWeatherData(
      Map<String, dynamic> weatherData, int index) {
    double degree = weatherData['list'][index]['main']['temp'] - 273.15;
    String desc = weatherData['list'][index]['weather'][0]["description"];
    String time = weatherData['list'][index]["dt_txt"];

    return FutureWeatherData(degree, desc, time);
  }

  static SunRiseSet extractSunRiseeAndSet(Map<String, dynamic> weatherData) {
    // Extract sunrise and sunset timestamps
    int sunriseTimestamp = weatherData['sys']['sunrise'];
    int sunsetTimestamp = weatherData['sys']['sunset'];

    // Convert timestamps to DateTime objects
    DateTime sunriseDateTime =
        DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp * 1000);
    DateTime sunsetDateTime =
        DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000);

    // Format DateTime objects to AM/PM format
    String sunrise = DateFormat.jm().format(sunriseDateTime);
    String sunset = DateFormat.jm().format(sunsetDateTime);
    return SunRiseSet(sunrise, sunset);
  }
}

class WeatherData {
  final double degree;
  final String desc;
  final double highest;
  final double lowest;

  WeatherData(
    this.degree,
    this.desc,
    this.highest,
    this.lowest,
  );
}

class FutureWeatherData {
  final double degree;
  final String desc;
  final String time;
  FutureWeatherData(this.degree, this.desc, this.time);
}

class SunRiseSet {
  final String sunrise;
  final String sunset;
  SunRiseSet(this.sunrise, this.sunset);
}
