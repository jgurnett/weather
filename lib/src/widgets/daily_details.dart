import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weather/src/models/weather.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/widgets/hourly_forcast_item.dart';

class DailyDetails extends StatelessWidget {
  final DateTime sunrise;
  final DateTime sunset;
  final String windSpeed;
  final double humidity;

  const DailyDetails(
      {super.key,
      required this.sunrise,
      required this.sunset,
      required this.windSpeed,
      required this.humidity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Daily details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black, // Choose your border color
                width: 1.0, // Adjust border width as needed
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sunrise',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '${sunrise.hour}:${sunrise.minute}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sunset',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '${sunset.hour}:${sunset.minute}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black, // Choose your border color
                width: 1.0, // Adjust border width as needed
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Wind',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      windSpeed,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Humidity',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '$humidity %',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
