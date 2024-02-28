class WeatherModel {
  final DateTime date;
  final List<ForecastModel> hourlyForecast;
  final double forecast;
  final String city;
  final String description;
  final DateTime sunrise;
  final DateTime sunset;
  final double windSpeed;
  final double humidity;

  WeatherModel(
      {required this.date,
      required this.hourlyForecast,
      required this.forecast,
      required this.city,
      required this.description,
      required this.sunrise,
      required this.sunset,
      required this.windSpeed,
      required this.humidity});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> forecastList = json['list'];
    final List<ForecastModel> forecastMapped = forecastList
        .map((forecastJson) => ForecastModel.fromJson(forecastJson))
        .toList();

    final windSpeed = forecastList[0]['wind']['speed'];
    final humidity = forecastList[0]['main']['humidity'];

    return WeatherModel(
      date: DateTime.fromMillisecondsSinceEpoch(forecastList[0]['dt'] * 1000),
      forecast: forecastList[0]['main']['temp'],
      hourlyForecast: forecastMapped,
      city: json['city']['name'],
      description: forecastList[0]['weather'][0]['description'],
      sunrise:
          DateTime.fromMillisecondsSinceEpoch(json['city']['sunrise'] * 1000),
      sunset:
          DateTime.fromMillisecondsSinceEpoch(json['city']['sunset'] * 1000),
      windSpeed: windSpeed is int ? windSpeed.toDouble() : windSpeed,
      humidity: humidity is int ? humidity.toDouble() : humidity,
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
    final temp = json['main']['temp'];
    return ForecastModel(
      temperature: temp is int ? temp.toDouble() : temp,
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      description: json['weather'][0]['description'],
    );
  }
}
