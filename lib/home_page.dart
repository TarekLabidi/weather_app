import 'package:flutter/material.dart';
import 'package:weather_app/Views/mobileView/mobile_view.dart';
import 'package:weather_app/Views/pc_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Making sure the app look good on all resolutions
    if (MediaQuery.of(context).size.width < 650 ||
        MediaQuery.of(context).size.height < 500) {
      return buildMobileView();
    } else {
      return BuildPcView();
    }
  }
}
