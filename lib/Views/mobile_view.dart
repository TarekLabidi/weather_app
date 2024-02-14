import 'package:flutter/material.dart';
import 'package:weather_app/mobileView/horizontal_layout.dart';
import '../mobileView/vertical_layout/mobile_home_page.dart';

class BuildMobileView extends StatefulWidget {
  const BuildMobileView({super.key});

  @override
  State<BuildMobileView> createState() => _BuildMobileViewState();
}

class _BuildMobileViewState extends State<BuildMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Making sure the App looks good when the phone is Oriznted
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? const MobileVericalLayoutHomePage()
            : const HorizontalLayout();
      }),
    );
  }
}
