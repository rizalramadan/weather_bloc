import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/weather/core/temp_settings/temp_settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<TempSettingsCubit, TempSettingsState>(
          builder: (context, state) {
            return ListTile(
              title: const Text('Temperature Unit'),
              subtitle: Text(
                state.isFarenheit ? 'Unit: Farenheit' : 'Unit: Celcius',
              ),
              trailing: Switch(
                value: state.isFarenheit,
                onChanged: (_) {
                  context.read<TempSettingsCubit>().changeUnit();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
