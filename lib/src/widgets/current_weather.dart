import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight:
          MediaQuery.of(context).size.height / 2, // 1/4 of the screen height
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), // Adjust border radius as needed
          bottomRight: Radius.circular(20), // Adjust border radius as needed
        ),
        child: Image.asset(
          'assets/sky_background.jpg', // Your image asset
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
      title: const Center(
        child: Column(
          children: [
            Text(
              'Edmonton',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Your Title',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      floating: false, // The app bar should not float
      pinned: true, // The app bar should remain pinned when scrolled
    );
  }
}
