import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/top_cercle_avatar.dart';
import 'package:weather_app/data/api.dart';
import 'package:weather_app/components/bottom_informations_sheet.dart';
import 'package:weather_app/components/text_widget.dart';
import 'package:weather_app/data/weather_provider.dart';

class LocalWeather extends StatefulWidget {
  const LocalWeather({super.key});

  @override
  State<LocalWeather> createState() => _LocalWeatherState();
}

class _LocalWeatherState extends State<LocalWeather> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeWeatherData();
  }

  Future<void> initializeWeatherData() async {
    try {
      final res = await WeatherApi.getCurrentWeather('Monastir,TN');
      final weatherData = WeatherApi.extractWeatherData(res);

      setState(() {
        Provider.of<WeatherProvider>(context, listen: false)
            .homePageVars(weatherData);

        isLoading = false;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return (isLoading == false)
        ? Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  context.watch<WeatherProvider>().getBackground(),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/house1.png',
                        height: height * 0.65,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.1),
                    Center(
                      child: TextWidget(
                        width: width,
                      ),
                    ),
                    const Spacer(),
                    const BottomInformationsSheet(),
                  ],
                ),
                const TopCercleAvatar(),
              ],
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
