import 'package:flutter/material.dart';
import 'package:weather/src/models/weather.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/widgets/hourly_forcast_item.dart';

class HourlyForecast extends StatelessWidget {
  final List<ForecastModel> hourlyForecast;

  const HourlyForecast({super.key, required this.hourlyForecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Today\'s detailed forecast',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 115, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyForecast.length,
            itemBuilder: (context, index) {
              IconData weatherIcon;
              String weatherDescription =
                  hourlyForecast[index].description.toLowerCase();

              // Determine which icon to use based on weather description
              if (weatherDescription.contains('cloudy')) {
                weatherIcon = Icons.cloud;
              } else if (weatherDescription.contains('sunny')) {
                weatherIcon = Icons.wb_sunny;
              } else if (weatherDescription.contains('rainy')) {
                weatherIcon = Icons.beach_access;
              } else if (weatherDescription.contains('snowy')) {
                weatherIcon = Icons.cloudy_snowing;
              } else {
                weatherIcon =
                    Icons.error; // Default icon for unknown weather conditions
              }
              return HourlyForecastItem(
                  weatherIcon: weatherIcon,
                  date: hourlyForecast[index].date,
                  temperature: hourlyForecast[index].temperature);
            },
          ),
        ),
      ],
    );
  }
}
