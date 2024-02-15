class WeatherLogic {
  static String getIcon(String desc, String time) {
    if (desc == 'few clouds' ||
        desc == "broken clouds" ||
        desc == 'scattered clouds') {
      //adding ?? 0 bc the time will not be instatanly provided so the period of the time that the api takes to get the time i am avoid the eroor and setting it to 0 and that will be chanegd once the api give me time
      if (isNightTime(int.tryParse(time) ?? 0)) {
        return 'assets/images/brokencloudiconam.png';
      } else {
        return 'assets/images/brokencloudiconpm.png';
      }
    } else if (desc == "overcast clouds" || desc == "light rain") {
      if (isNightTime(int.tryParse(time) ?? 0)) {
        return 'assets/images/rainycloudam.png';
      } else {
        return 'assets/images/rainycloudpm.png';
      }
    } else {
      if (isNightTime(int.tryParse(time) ?? 0)) {
        return 'assets/images/moon.png';
      } else {
        return 'assets/images/sun.png';
      }
    }
  }

  static bool isNightTime(int hour) {
    return hour > 18 || hour < 6;
  }
}
