import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/weather_provider.dart';
import 'local_weather_card.dart';

class WeatherInformations extends StatelessWidget {
  const WeatherInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: 165,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              itemBuilder: (context, index) {
                return LocalWeatherCard(index: index);
              }),
        ),
        const Spacer(),
        Row(
          children: [
            // didnt use Bottom Navigation Bar for UI decoration
            GestureDetector(
              onTap: () {
                context.read<WeatherProvider>().changePage(0);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 5,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white),
                    right: BorderSide(color: Colors.white),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.50),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 40,
                    color: (context.watch<WeatherProvider>().currentPage == 1)
                        ? Colors.grey
                        : const Color.fromARGB(255, 196, 55, 209),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<WeatherProvider>().changePage(1);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white),
                    left: BorderSide(color: Colors.white),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.explore,
                    size: 35,
                    color: (context.watch<WeatherProvider>().currentPage == 0)
                        ? Colors.grey
                        : const Color.fromARGB(255, 196, 55, 209),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
