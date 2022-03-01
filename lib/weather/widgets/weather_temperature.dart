import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/temp_settings/temp_settings_cubit.dart';

class WeatherTemperature extends StatelessWidget {
  const WeatherTemperature({
    Key? key,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
  }) : super(key: key);

  final double temp;
  final double minTemp;
  final double maxTemp;

  @override
  Widget build(BuildContext context) {
    String showTemp(double value) {
      final farenheit = context.watch<TempSettingsCubit>().state.isFarenheit;

      return farenheit == true
          ? ((value * 9 / 5) + 32).toStringAsFixed(1) + ' ℉'
          : '${value.toStringAsFixed(1)} ℃';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          showTemp(temp),
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              showTemp(minTemp),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              showTemp(maxTemp),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
