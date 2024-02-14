import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/api.dart';
import 'package:weather_app/data/weather_provider.dart';

class LocalWeatherCard extends StatefulWidget {
  final int index;
  const LocalWeatherCard({Key? key, required this.index}) : super(key: key);

  @override
  State<LocalWeatherCard> createState() => _LocalWeatherCardState();
}

class _LocalWeatherCardState extends State<LocalWeatherCard> {
  late double degree = 0;
  late String time = '';
  late String desc = '';
  void initState() {
    super.initState();
    initializeWeatherData();
  }

  Future<void> initializeWeatherData() async {
    try {
      final res = await WeatherApi.getCurrentWeather('Monastir,TN');
      final weatherData =
          WeatherApi.extractFutureWeatherData(res, widget.index);

      setState(() {
        degree = weatherData.degree;
        time = weatherData.time;
        time = time[11] + time[12];
      });
      if (widget.index == 10) {
        print('ok');
        context.read<WeatherProvider>().finishedLoading();
      } else {
        print('no');
      }
    } catch (e) {
      rethrow;
    }
  }

  String getIcon() {
    if (desc == 'few clouds' ||
        desc == "broken clouds" ||
        desc == 'scattered clouds') {
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

  bool isNightTime(int hour) {
    return hour > 18 || hour < 6;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //Creating a blurred Container with a white border
    return (widget.index != 0)
        ? Stack(
            children: [
              // Container blurred
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                    child: Material(
                      color: Colors.transparent,
                      // Wrap with Material widget
                      elevation: 8, // Set elevation
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      child: Container(
                        width: width / 6,
                        height: height / 5,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 151, 128, 233)
                                  .withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(10, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height / 48,
                            ),
                            Text(
                              "$time:00",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Spacer(),
                            Image.asset(
                              getIcon(),
                              width: 70,
                              height: 50,
                            ),
                            const Spacer(),
                            Text(
                              "${degree.toStringAsFixed(2)}°",
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: height / 48,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Container with border
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width / 6,
                  height: height / 5,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 0.4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                ),
              ),
            ],
          )
        : SizedBox(
            width: width / 18,
          );
  }
}
