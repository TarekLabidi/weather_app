import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
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
            const Spacer(),
            Text(
              "Weekly Forcast",
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
              child: const Divider(
                thickness: 0.5,
                color: Color.fromARGB(255, 197, 194, 194),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              child: const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 197, 194, 194),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: const Divider(
                thickness: 0.5,
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
        Divider(
          thickness: 1,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 5,
              child: Icon(
                Icons.location_on_outlined,
                size: 40,
                color: Colors.white,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Icon(
                Icons.location_on_outlined,
                size: 40,
                color: Colors.white,
              ),
            )
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
