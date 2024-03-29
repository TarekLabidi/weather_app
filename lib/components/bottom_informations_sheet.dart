import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/components/bottom_sheet_widget.dart';
import 'package:weather_app/components/weather_informations.dart';

class BottomInformationsSheet extends StatelessWidget {
  const BottomInformationsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // Creating a blurred Container with a white border
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: width,
          height: height / 3 + 10,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.4),
            color: Colors.transparent,
          ),
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if ((details.primaryDelta ?? 0) < -6) {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const BottomSheetWidget();
                  },
                );
              }
            },
            child: const WeatherInformations(),
          ),
        ),
      ),
    );
  }
}
