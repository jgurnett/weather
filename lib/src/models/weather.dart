class WeatherModel {
  final DateTime date;
  final List<ForecastModel> hourlyForecast;
  final ForecastModel forecast;
  final String city;
  final String description;

  WeatherModel({
    required this.date,
    required this.hourlyForecast,
    required this.forecast,
    required this.city,
    required this.description,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> forecastList = json['list'];
    final List<ForecastModel> forecast = forecastList
        .map((forecastJson) => ForecastModel.fromJson(forecastJson))
        .toList();

    return WeatherModel(
      date: DateTime.fromMillisecondsSinceEpoch(forecastList[0]['dt'] * 1000),
      forecast: forecastList[0].json['main']['temp'].toDouble(),
      hourlyForecast: forecast,
      city: json['city']['name'],
      description: forecastList[0]['weather'][0]['description'],
    );
  }
}

class ForecastModel {
  final double temperature;
  final DateTime date;
  final String description;

  ForecastModel(
      {required this.temperature,
      required this.date,
      required this.description});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
        temperature: json['main']['temp'].toDouble(),
        date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        description: json['weather'][0]['description']);
  }
}
