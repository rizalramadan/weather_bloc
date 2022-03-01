import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/routes.dart' as route;
import '../../utils/error_dialog.dart';
import '../core/weather/weather_bloc.dart';
import '../widgets/weather_city_time.dart';
import '../widgets/weather_icon_name.dart';
import '../widgets/weather_temperature.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route.search);
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route.settings);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.status == WeatherStatus.initial) {
            return const Center(
              child: Text(
                'Input City Name',
                style: TextStyle(fontSize: 32),
              ),
            );
          }
          if (state.status == WeatherStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == WeatherStatus.error &&
              state.weather.title == '') {
            const Center(
              child: Text(
                'Input City Name',
                style: TextStyle(fontSize: 32),
              ),
            );
          }
          return ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              WeatherCityTime(
                city: state.weather.title,
                lastUpdate: state.weather.lastUpdated,
              ),
              const SizedBox(height: 48),
              WeatherTemperature(
                temp: state.weather.temp,
                minTemp: state.weather.minTemp,
                maxTemp: state.weather.maxTemp,
              ),
              const SizedBox(height: 48),
              WeatherIconName(
                name: state.weather.weatherStateNmae,
                abbr: state.weather.weatherStateAbbr,
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state.status == WeatherStatus.error) {
            errorDialog(context, state.error.message);
          }
        },
      ),
    );
  }
}
