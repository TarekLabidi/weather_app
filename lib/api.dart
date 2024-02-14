import 'dart:convert';
import 'package:http/http.dart' as http;

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

  static WeatherData extractWeatherData(Map<String, dynamic> weatherData) {
    double degree = weatherData['list'][1]['main']['temp'] - 273.15;
    String desc = weatherData['list'][1]['weather'][0]["description"];
    double highest = weatherData['list'][1]['main']['temp_max'] - 273.15;
    double lowest = weatherData['list'][1]['main']['temp_min'] - 273.15;

    return WeatherData(degree, desc, highest, lowest);
  }
}

class WeatherData {
  final double degree;
  final String desc;
  final double highest;
  final double lowest;

  WeatherData(this.degree, this.desc, this.highest, this.lowest);
}
