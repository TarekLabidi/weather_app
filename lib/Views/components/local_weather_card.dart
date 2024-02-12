import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocalWeatherCard extends StatelessWidget {
  final int index;
  const LocalWeatherCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //Creating a blurred Container with a white border
    return (index != 0)
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
                        width: width / 7,
                        height: height / 6,
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
                              "12 PM",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: height / 84,
                            ),
                            Image.asset(
                              'assets/images/rainycloud.png',
                              width: 60,
                              height: 40,
                            ),
                            const Spacer(),
                            Text(
                              "19°",
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
                  width: width / 7,
                  height: height / 6,
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
