import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_bloc/weather/core/temp_settings/temp_settings_cubit.dart';
import 'repositories/services/weather_api_service.dart';
import 'repositories/weather_repository.dart';
import 'routes/routes.dart' as route;
import 'weather/core/theme/theme_bloc.dart';
import 'weather/core/weather/weather_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        weatherApiService: WeatherApiService(
          client: http.Client(),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider<TempSettingsCubit>(
            create: (context) => TempSettingsCubit(),
          ),
        ],
        child: BlocListener<WeatherBloc, WeatherState>(
          listener: (context, state) {
            context
                .read<ThemeBloc>()
                .add(ThemeOnTemp(temp: state.weather.temp));
          },
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: state.appThemes == AppThemes.light
                    ? ThemeData.light()
                    : ThemeData.dark(),
                onGenerateRoute: route.generateRoute,
                initialRoute: route.home,
              );
            },
          ),
        ),
      ),
    );
  }
}
