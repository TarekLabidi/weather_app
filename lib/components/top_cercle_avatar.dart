import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/weather_provider.dart';

class TopCercleAvatar extends StatelessWidget {
  const TopCercleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
        child: GestureDetector(
          onTap: () {
            context.read<WeatherProvider>().changePage(1);
          },
          child: const CircleAvatar(
            radius: 26,
            child: Icon(
              Icons.list,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
