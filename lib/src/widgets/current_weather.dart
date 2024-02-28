import 'package:flutter/material.dart';
import 'package:weather/src/constants/consts.dart';

class CurrentWeather extends StatelessWidget {
  final String city;
  final double currentTemp;

  const CurrentWeather({
    super.key,
    required this.city,
    required this.currentTemp,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 2,
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                city,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '$currentTemp ${degreeSymbol}C',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Image.asset(
            'assets/sky_background.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2,
          ),
        ),
      ),
      floating: false, // The app bar should not float
      pinned: true, // The app bar should remain pinned when scrolled
    );
  }
}
