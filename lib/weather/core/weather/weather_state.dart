part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  error,
}

class WeatherState extends Equatable {
  const WeatherState({
    required this.status,
    required this.weather,
    required this.error,
  });

  final WeatherStatus status;
  final Weather weather;
  final CustomError error;

  factory WeatherState.initial() {
    return WeatherState(
      status: WeatherStatus.initial,
      weather: Weather.initial(),
      error: const CustomError(),
    );
  }

  @override
  List<Object> get props => [status, weather, error];

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    CustomError? error,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'WeatherState(statur: $status, weather: $weather, error: $error)';
}
