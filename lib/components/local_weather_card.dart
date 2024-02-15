import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/data/api.dart';
import 'package:weather_app/data/logic.dart';

class LocalWeatherCard extends StatefulWidget {
  final int index;
  final bool isPc;
  const LocalWeatherCard({Key? key, required this.index, required this.isPc})
      : super(key: key);

  @override
  State<LocalWeatherCard> createState() => _LocalWeatherCardState();
}

class _LocalWeatherCardState extends State<LocalWeatherCard> {
  late double degree = 0;
  late String time = '';
  late String desc = '';

  @override
  void initState() {
    super.initState();
    initializeWeatherData();
  }

  Future<void> initializeWeatherData() async {
    try {
      final res = await WeatherApi.getCurrentWeather('Monastir,TN');
      final weatherData =
          WeatherApi.extractFutureWeatherData(res, widget.index);
      //checking if the widget is still in the widget tree or not before calling setstate to avoid error
      if (mounted) {
        setState(() {
          degree = weatherData.degree;
          time = weatherData.time;
          time = time[11] + time[12];
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //Creating a blurred Container with a white border
    return (widget.index != 0 || widget.isPc == true)
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
                        width: width / 5,
                        height: height / 4,
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
                              WeatherLogic.getIcon(desc, time),
                              width: width / 20,
                              height: height / 20,
                            ),
                            const Spacer(),
                            Text(
                              "${degree.toStringAsFixed(2)}°",
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
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
                  width: width / 5,
                  height: height / 4,
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
