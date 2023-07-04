import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Pages/search_screen.dart';
import 'package:weather_app/controllers/weather_controller.dart';

import '../Widgets/five_days_forcast.dart';
import '../Widgets/today_condition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherController>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var weatherController = context.watch<WeatherController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SearchScreen();
                    },
                  ));
                },
                icon: const Icon(Icons.search),
              ),
            )
          ],
        ),
        body: weatherController.isLoading ||
                weatherController.weatherModel == null
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () => weatherController.fetchData(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CurrentCondition(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: SizedBox(
                          height: 130,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: weatherController
                                .weatherModel!.forecast!.forecastday!.length,
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return FiveDaysForcast(weatherController
                                  .weatherModel!.forecast!.forecastday![index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
