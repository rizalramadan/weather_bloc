import 'package:flutter/material.dart';

import '../../constants/constans.dart';

class WeatherIconName extends StatelessWidget {
  const WeatherIconName({
    Key? key,
    required this.name,
    required this.abbr,
  }) : super(key: key);

  final String name;
  final String abbr;

  @override
  Widget build(BuildContext context) {
    Widget showIcon(String abbr) {
      return FadeInImage.assetNetwork(
        placeholder: 'assets/loading.gif',
        image: 'https://$kHost/static/img/weather/png/64/$abbr.png',
        width: 64,
        height: 64,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        showIcon(abbr),
        const SizedBox(width: 24),
        Text(
          name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
