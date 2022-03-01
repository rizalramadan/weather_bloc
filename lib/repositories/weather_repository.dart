import 'package:weather_bloc/repositories/services/weather_api_service.dart';
import 'package:weather_bloc/weather/models/custom_error.dart';

import '../weather/models/weather_model.dart';
import 'exceptions/weather_exception.dart';

class WeatherRepository {
  final WeatherApiService weatherApiService;

  WeatherRepository({
    required this.weatherApiService,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final woeid = await weatherApiService.getWoeid(city);

      final weather = await weatherApiService.getWeather(woeid);

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(message: e.message);
    } catch (e) {
      throw CustomError(message: e.toString());
    }
  }
}
