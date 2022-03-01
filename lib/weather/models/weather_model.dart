import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.weatherStateNmae,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
    required this.title,
    required this.woeid,
    required this.lastUpdated,
  });

  final String weatherStateNmae;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final String title;
  final int woeid;
  final DateTime lastUpdated;

  factory Weather.fromJson(Map<String, dynamic> json) {
    final consolidatedWeather = json['consolidated_weather'][0];

    return Weather(
      weatherStateNmae: consolidatedWeather['weather_state_name'],
      weatherStateAbbr: consolidatedWeather['weather_state_abbr'],
      created: consolidatedWeather['created'],
      minTemp: consolidatedWeather['min_temp'],
      maxTemp: consolidatedWeather['max_temp'],
      temp: consolidatedWeather['the_temp'],
      title: json['title'],
      woeid: json['woeid'],
      lastUpdated: DateTime.now(),
    );
  }

  factory Weather.initial() {
    return Weather(
      weatherStateNmae: '',
      weatherStateAbbr: '',
      created: '',
      minTemp: 10.0,
      maxTemp: 10.0,
      temp: 10.0,
      title: '',
      woeid: -10,
      lastUpdated: DateTime(1970),
    );
  }

  @override
  List<Object> get props {
    return [
      weatherStateNmae,
      weatherStateAbbr,
      created,
      minTemp,
      maxTemp,
      temp,
      title,
      woeid,
      lastUpdated,
    ];
  }
}
