import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/weather_controller.dart';

class CurrentCondition extends StatefulWidget {
  const CurrentCondition({super.key});

  @override
  State<CurrentCondition> createState() => _CurrentConditionState();
}

class _CurrentConditionState extends State<CurrentCondition> {
  @override
  Widget build(BuildContext context) {
    var todayCondition =
        context.watch<WeatherController>().weatherModel!.current!;

    return Card(
      margin: const EdgeInsets.all(16),
      color: Colors.lightBlueAccent,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 100,
            backgroundColor: const Color.fromARGB(255, 220, 199, 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  todayCondition.isDay == 1
                      ? 'assets/images/sunny.png'
                      : 'assets/images/moon.png',
                  color: Colors.white,
                  width: 40,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  todayCondition.condition!.text!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${todayCondition.tempC.toString()} °C',
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Feel like:\n${todayCondition.feelslikeC.toString()} °C',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today\'s Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Temperature',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '${todayCondition.tempC.toString()} °C',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '${todayCondition.tempF.toString()} °F',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Wind Speed',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '${todayCondition.windKph.toString()} km/h',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Temperature Feel Like',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${todayCondition.feelslikeC.toString()} °C',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '${todayCondition.feelslikeF.toString()} °F',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Weather Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  todayCondition.condition!.text!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Cloud Cover',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${todayCondition.cloud} %',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
