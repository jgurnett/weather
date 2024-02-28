import 'package:flutter/material.dart';
import 'package:weather/src/models/weather.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 165, // Adjust height as needed
            child: HourlyForecast(
              hourlyForecast: [
                ForecastModel(
                    temperature: -11,
                    date: DateTime.now(),
                    description: 'sunny'),
                ForecastModel(
                    temperature: -11,
                    date: DateTime.now().add(const Duration(hours: 3)),
                    description: 'sunny'),
                ForecastModel(
                    temperature: -11,
                    date: DateTime.now().add(const Duration(hours: 6)),
                    description: 'cloudy'),
                ForecastModel(
                    temperature: -11,
                    date: DateTime.now().add(const Duration(hours: 9)),
                    description: 'cloudy'),
                ForecastModel(
                    temperature: -11,
                    date: DateTime.now().add(const Duration(hours: 12)),
                    description: 'snowy')
              ],
            ),
          ),
          const SizedBox(
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
