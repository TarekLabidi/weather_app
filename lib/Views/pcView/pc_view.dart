import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Views/mobileView/vertical_layout/pages/other_weather.dart';
import 'package:weather_app/components/local_weather_card.dart';
import 'package:weather_app/components/region_weather_card.dart';
import 'package:weather_app/components/text_widget.dart';
import 'package:weather_app/data/api.dart';
import 'package:weather_app/data/weather_provider.dart';

class BuildPcView extends StatefulWidget {
  const BuildPcView({super.key});

  @override
  State<BuildPcView> createState() => _BuildPcViewState();
}

class _BuildPcViewState extends State<BuildPcView> {
  bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   initializeWeatherData();
  // }

  // Future<void> initializeWeatherData() async {
  //   try {
  //     final res = await WeatherApi.getCurrentWeather('Monastir,TN');
  //     final weatherData = WeatherApi.extractWeatherData(res);

  //     setState(() {
  //       Provider.of<WeatherProvider>(context, listen: false)
  //           .homePageVars(weatherData);

  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  List<String> cities = otherCities;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return (isLoading == false)
        ? Scaffold(
            backgroundColor: const Color.fromARGB(255, 63, 45, 116),
            body: Row(
              children: [
                SizedBox(
                  width: width / 2 - 20,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 16,
                      ),
                      TextWidget(width: width),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Hourly Forcast",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: const Color.fromARGB(255, 209, 205, 205),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 34,
                            child: const Divider(
                              thickness: 2,
                              color: Color.fromARGB(255, 197, 194, 194),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: height / 2 - 20,
                        width: width / 2 - 20,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (width > 1150)
                                ? 4
                                : (width > 850)
                                    ? 3
                                    : 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return LocalWeatherCard(
                              index: index,
                              isPc: true,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height / 84,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: width / 2 - 40,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 16,
                      ),
                      const Text(
                        'Weather',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: SizedBox(
                          height: 55,
                          child: TextField(
                            controller: controller,
                            style: const TextStyle(
                                color: Colors.white, letterSpacing: 1),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                hintText: 'Search here',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Color.fromRGBO(36, 33, 67, 1),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            onChanged: searchCity,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: cities.length,
                            itemBuilder: (context, index) {
                              final city = cities[index];
                              return RegionWeatherCard(
                                city: city,
                              );
                            }),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width / 480,
                ),
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }

  void searchCity(String query) {
    final suggestions = otherCities.where((city) {
      final cityname = city.toLowerCase();
      final input = query.toLowerCase();
      return cityname.contains(input);
    }).toList();
    setState(() {
      cities = suggestions;
    });
  }
}
