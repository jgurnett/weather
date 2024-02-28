import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/src/constants/api_key.dart';
import 'package:weather/src/models/weather.dart';

Future<WeatherModel> fetchHourlyForecast() async {
  const apiUrl =
      'https://api.openweathermap.org/data/2.5/forecast?lon=-113.323975&lat=53.631611&appid=$apiKey&units=metric';

  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final decodedJson = json.decode(response.body);
    return WeatherModel.fromJson(decodedJson);
  } else {
    throw Exception('Failed to load hourly forecast');
  }
}
