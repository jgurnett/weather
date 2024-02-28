import 'package:flutter/material.dart';
import 'package:weather/src/models/weather.dart';
import 'package:weather/src/widgets/daily_details.dart';
import 'package:weather/src/widgets/daily_forcast.dart';
import 'package:weather/src/widgets/hourly_forcast.dart';
import 'package:weather/src/widgets/current_weather.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CurrentWeather(
            city: 'Edmonton',
            currentTemp: -11,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              // Your DailyWeatherForcast widget
              HourlyForecast(
                hourlyForecast: [
                  ForecastModel(
                      temperature: -11,
                      date: DateTime.now(),
                      description: 'sunny'),
                  ForecastModel(
                      temperature: -11,
                      date: DateTime.now().add(const Duration(hours: 3)),
                      description: 'sunny'),
                ],
              ),

              DailyDetails(
                  sunrise: DateTime.now(),
                  sunset: DateTime.now(),
                  windSpeed: '12 km/h',
                  humidity: 12.0),
              const DailyForecast(
                dailyForecast: [
                  'monday',
                  'tuesday',
                  'wednesday',
                  'thursday',
                  'friday',
                  'saturday'
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
