class Weather {
  Weather({key});
  late String desc;
  Future GetCurrentWeather() async {
    try {
      const apiKey =
          '69fa17bd7ec7b060c3ccd21d5d9307b6'; // Replace this with your actual API key
      const city = 'Monastir,TN';
      final url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city,uk&APPID=$apiKey');
    } catch (e) {
      throw (e);
    }
  }
}
