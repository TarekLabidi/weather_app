import 'package:flutter/material.dart';

class SunRiseSetWidget extends StatelessWidget {
  const SunRiseSetWidget({
    super.key,
    required this.sunrise,
    required this.height,
    required this.sunset,
  });

  final String sunrise;
  final double height;
  final String sunset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'SunRise',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          sunrise,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Stack(
          children: [
            Image.asset(
              'assets/images/sunCourbe.png',
              height: height / 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 10,
                ),
                Text(
                  '            SunSet:  $sunset',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
