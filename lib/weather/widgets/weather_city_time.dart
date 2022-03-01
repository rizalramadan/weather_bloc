import 'package:flutter/material.dart';

class WeatherCityTime extends StatelessWidget {
  const WeatherCityTime({
    Key? key,
    required this.city,
    required this.lastUpdate,
  }) : super(key: key);

  final String city;
  final DateTime lastUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          TimeOfDay.fromDateTime(lastUpdate).format(context),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
