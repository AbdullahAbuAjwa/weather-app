import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class FiveDaysForcast extends StatelessWidget {
  final Forecastday forecastday;
  const FiveDaysForcast(this.forecastday, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset('assets/images/sunny.png', width: 16),
                const SizedBox(
                  width: 10,
                ),
                Text(forecastday.date.toString().substring(0, 10)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Max: ${forecastday.day!.maxtempC} °C'),
            const SizedBox(
              height: 10,
            ),
            Text('Min: ${forecastday.day!.mintempC} °C'),
          ],
        ),
      ),
    );
  }
}
