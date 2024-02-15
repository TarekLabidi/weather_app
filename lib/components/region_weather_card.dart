import 'package:flutter/material.dart';

import 'package:weather_app/data/api.dart';

class RegionWeatherCard extends StatefulWidget {
  final String city;
  const RegionWeatherCard({Key? key, required this.city})
      : super(
          key: key,
        );

  @override
  State<RegionWeatherCard> createState() => _RegionWeatherCardState();
}

class _RegionWeatherCardState extends State<RegionWeatherCard> {
  bool isLoading = true;
  late double degree = 0;
  late String desc = "";
  late double highest = 0;
  late double lowest = 0;

  @override
  void initState() {
    super.initState();
    initializeWeatherData();
  }

  Future<void> initializeWeatherData() async {
    try {
      final res = await WeatherApi.getCurrentWeather(widget.city);
      final weatherData = WeatherApi.extractWeatherData(res);

      if (mounted) {
        setState(() {
          degree = weatherData.degree;
          desc = weatherData.desc;
          highest = weatherData.highest;
          lowest = weatherData.lowest;
          isLoading = false;
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(150)),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 20),
            elevation: 6,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                height: 200,
                color: const Color.fromARGB(255, 76, 50, 163),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height / 64, left: 24),
                      child: Text(
                        '${degree.toStringAsFixed(2)}°',
                        style: const TextStyle(
                          fontSize: 56,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: height / 480),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          'H:${highest.toStringAsFixed(2)}°',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 197, 194, 194),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 24,
                        ),
                        Text(
                          'H:${lowest.toStringAsFixed(2)}°',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 197, 194, 194),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 480),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            desc,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.city,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            'assets/images/rainycloudam.png',
          ),
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height - 50);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
