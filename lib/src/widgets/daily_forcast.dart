import 'package:flutter/material.dart';

class DailyForecast extends StatelessWidget {
  final List<String> dailyForecast;

  const DailyForecast({super.key, required this.dailyForecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Weekly forecast',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 100, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dailyForecast.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100, // Adjust width as needed
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    dailyForecast[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
