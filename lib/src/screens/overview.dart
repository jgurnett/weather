import 'package:flutter/material.dart';
import 'package:weather/src/models/weather.dart';
import 'package:weather/src/services/open_weather.dart';
import 'package:weather/src/widgets/daily_details.dart';
import 'package:weather/src/widgets/daily_forcast.dart';
import 'package:weather/src/widgets/hourly_forcast.dart';
import 'package:weather/src/widgets/current_weather.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  late WeatherModel weatherData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final data = await fetchHourlyForecast();
      print(data.city);
      setState(() {
        weatherData = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CurrentWeather(
            city: weatherData.city,
            currentTemp: weatherData.forecast,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              HourlyForecast(
                hourlyForecast: weatherData.hourlyForecast.take(7).toList(),
              ),
              DailyDetails(
                  sunrise: weatherData.sunrise,
                  sunset: weatherData.sunset,
                  windSpeed: '${weatherData.windSpeed} km/h',
                  humidity: weatherData.humidity),
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
