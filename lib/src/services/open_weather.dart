import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/src/models/weather.dart';

Future<WeatherModel> fetchHourlyForecast() async {
  // TODO come back to this
  const apiKey = '';
  const city = 'Edmonton';
  const apiUrl =
      'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';

  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final decodedJson = json.decode(response.body);
    return WeatherModel.fromJson(decodedJson);
  } else {
    throw Exception('Failed to load hourly forecast');
  }
}
