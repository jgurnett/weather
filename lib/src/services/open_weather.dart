import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/src/models/weather.dart';

Future<List<String>> fetchHourlyForecast() async {
  const apiKey =
      'c3beb27de3c5af2967e842e2c1088207'; // Replace 'YOUR_API_KEY' with your actual API key
  const city = 'Edmonton'; // Replace 'New York' with your desired city
  const apiUrl =
      'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';

  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<dynamic> forecasts = data['list'];
    final List<String> forecastHours = [];
    for (var forecast in forecasts) {
      final DateTime dateTime = DateTime.parse(forecast['dt_txt']);
      final hour = '${dateTime.hour}:00';
      final temp = forecast['main']['temp'];
      forecastHours.add('$hour - $temp°C');
    }
    return forecastHours;
  } else {
    throw Exception('Failed to load hourly forecast');
  }
}
