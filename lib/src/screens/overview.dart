import 'package:flutter/material.dart';
import 'package:weather/src/widgets/daily_forcast.dart';
import 'package:weather/src/widgets/hourly_forcast.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 145, // Adjust height as needed
            child: HourlyForecast(
              hourlyForecast: [
                '1 PM',
                '2 PM',
                '3 PM',
                '4 PM',
                '5 PM',
                '6 PM',
                '7 PM',
                '8 PM',
                '9 PM',
                '10 PM'
              ],
            ),
          ),
          SizedBox(
            height: 145, // Adjust height as needed
            child: DailyForecast(
              dailyForecast: [
                'monday',
                'tuesday',
                'wednesday',
                'thursday',
                'friday',
                'saturday'
              ],
            ),
          ),
          // Add other child widgets here
        ],
      ),
    );
  }
}
