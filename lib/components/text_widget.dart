import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final double degree;
  final String desc;
  final double highest;
  final double lowest;
  const TextWidget(
      {super.key,
      required this.width,
      required this.degree,
      required this.desc,
      required this.highest,
      required this.lowest});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Monastir',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: Colors.white,
              letterSpacing: 1.5),
        ),
        Text(
          '${degree.toStringAsFixed(2)} °',
          style: GoogleFonts.lato(
              fontSize: 78,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              letterSpacing: 1.5),
        ),
        Text(
          desc,
          style: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 187, 185, 185),
              letterSpacing: 1.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'H:${highest.toStringAsFixed(2)}°',
              style: GoogleFonts.lato(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5),
            ),
            SizedBox(width: width / 24),
            Text(
              'L:${lowest.toStringAsFixed(2)}°',
              style: GoogleFonts.lato(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5),
            ),
          ],
        )
      ],
    );
  }
}
