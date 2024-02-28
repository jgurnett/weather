import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyForecastItem extends StatelessWidget {
  final IconData weatherIcon;
  final DateTime date;
  final double temperature;

  const HourlyForecastItem({
    super.key,
    required this.weatherIcon,
    required this.date,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    const String degreeSymbol = '\u00B0';

    return Container(
      width: 100,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('h a').format(date),
            style: const TextStyle(fontSize: 16),
          ),
          Icon(
            weatherIcon,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(height: 5),
          Text(
            '${temperature.toString()} ${degreeSymbol}C',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
