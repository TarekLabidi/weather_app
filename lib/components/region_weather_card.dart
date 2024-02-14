import 'package:flutter/material.dart';

class RegionWeatherCard extends StatelessWidget {
  const RegionWeatherCard({Key? key}) : super(key: key);

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
                      child: const Text(
                        '19°',
                        style: TextStyle(
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
                        const Text(
                          'H:19°',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 197, 194, 194),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 24,
                        ),
                        const Text(
                          'L:19°',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 197, 194, 194),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 480),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Fast Wind',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        const Text(
                          'Soussa',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
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
