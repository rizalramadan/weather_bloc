import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/weather/weather_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _city;
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'City Name',
                    hintText: 'Search City',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().length < 2) {
                      return 'Name must at least have two character!';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _city = value;
                  },
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;

                    final form = _formKey.currentState;

                    if (form != null && form.validate()) {
                      form.save();
                      context
                          .read<WeatherBloc>()
                          .add(FetchWeatherEvent(city: _city!.trim()));
                      Navigator.pop(context);
                    }
                  });
                },
                child: const Text('Get Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
