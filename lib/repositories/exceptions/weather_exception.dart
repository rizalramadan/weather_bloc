class WeatherException implements Exception {
  String message;

  WeatherException({
    this.message = 'Something went wrong!',
  });

  @override
  String toString() => 'WeatherException(message: $message)';
}
