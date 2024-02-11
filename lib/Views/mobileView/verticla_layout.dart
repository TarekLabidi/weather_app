import 'package:flutter/material.dart';

class VerticalLayout extends StatefulWidget {
  const VerticalLayout({super.key});

  @override
  State<VerticalLayout> createState() => _VerticalLayoutState();
}

class _VerticalLayoutState extends State<VerticalLayout> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/stars.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/house.png',
              height: height * 0.55,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.2),
              Center(child: Text('Monastir')),
            ],
          )
        ],
      ),
    );
  }
}
