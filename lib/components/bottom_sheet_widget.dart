import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/components/local_weather_card.dart';
import 'package:weather_app/components/sun_rise_set_widget.dart';
import 'package:weather_app/data/api.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  late String sunrise = '';
  late String sunset = '';
  @override
  void initState() {
    super.initState();
    initializeWeatherData();
  }

  Future<void> initializeWeatherData() async {
    try {
      final res = await WeatherApi.getCurrentSun('Monastir,TN');
      final sunData = WeatherApi.extractSunRiseeAndSet(res);

      setState(() {
        sunrise = sunData.sunrise;
        sunset = sunData.sunset;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        height: height * 0.9,
        color: const Color.fromRGBO(25, 23, 57, 1.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  width: 50,
                  height: 5,
                  color: const Color.fromARGB(255, 164, 155, 155),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "Hourly Forcast",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 209, 205, 205),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const Divider(
                  thickness: 0.2,
                  color: Color.fromARGB(255, 197, 194, 194),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 14,
                  child: const Divider(
                    thickness: 2,
                    color: Color.fromARGB(255, 197, 194, 194),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return LocalWeatherCard(
                    index: index,
                    isPc: false,
                  );
                },
              ),
            ),
            SizedBox(
              height: height / 280,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(25, 23, 57, 1.0),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: SunRiseSetWidget(
                  sunrise: sunrise, height: height, sunset: sunset),
            )
          ],
        ),
      ),
    );
  }
}
