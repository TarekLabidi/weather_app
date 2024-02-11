import 'package:flutter/material.dart';
import 'package:weather_app/Views/mobileView/horizontal_layout.dart';
import 'package:weather_app/Views/mobileView/verticla_layout.dart';

class buildMobileView extends StatefulWidget {
  const buildMobileView({super.key});

  @override
  State<buildMobileView> createState() => _buildMobileViewState();
}

class _buildMobileViewState extends State<buildMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Making sure the App looks good when the phone is Oriznted
      body: OrientationBuilder(builder: (context, orientation) {
        print(orientation);
        return orientation == Orientation.portrait
            ? VerticalLayout()
            : HorizontalLayout();
      }),
    );
  }
}
