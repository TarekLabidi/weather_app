import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/weather_provider.dart';
import '../../../../components/region_weather_card.dart';

List<String> otherCities = [
  'Sousse,TN',
  'Mahdia,TN',
  'Tunis,TN',
  'Ariana,TN',
  'Bizerte,Tn',
];

class OtherWeathers extends StatefulWidget {
  const OtherWeathers({super.key});

  @override
  State<OtherWeathers> createState() => _OtherWeathersState();
}

class _OtherWeathersState extends State<OtherWeathers> {
  List<String> cities = otherCities;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 63, 45, 116),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 20,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<WeatherProvider>().changePage(0);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Weather',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: height / 20,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: SizedBox(
                  height: 55,
                  child: TextField(
                    controller: controller,
                    style:
                        const TextStyle(color: Colors.white, letterSpacing: 1),
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
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    onChanged: searchCity,
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: cities.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    return RegionWeatherCard(
                      city: city,
                    );
                  })
            ],
          ),
        ),
      ),
    );
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
