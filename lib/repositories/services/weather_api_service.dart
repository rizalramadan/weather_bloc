import 'dart:convert';

import 'package:http/http.dart' as http;
import '../exceptions/http_error_handler.dart';
import '../exceptions/weather_exception.dart';
import '../../weather/models/weather_model.dart';

import '../../constants/constans.dart';

class WeatherApiService {
  final http.Client client;

  WeatherApiService({
    required this.client,
  });

  Future<int> getWoeid(String city) async {
    final uri = Uri(
      scheme: 'https',
      host: kHost,
      path: '/api/location/search/',
      queryParameters: {'query': city},
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final responseBody = jsonDecode(response.body);
      if (responseBody.isEmpty) {
        throw WeatherException(message: 'Cannot get City ID');
      }
      if (responseBody.length > 2) {
        throw WeatherException(
          message: 'There are multiple candidate for this city',
        );
      }

      final woeid = responseBody[0]['woeid'];
      return woeid;
    } catch (e) {
      rethrow;
    }
  }

  Future<Weather> getWeather(int woeid) async {
    final uri = Uri(
      scheme: 'https',
      host: kHost,
      path: '/api/location/$woeid',
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final responseBody = jsonDecode(response.body);
      final Weather weather = Weather.fromJson(responseBody);

      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
