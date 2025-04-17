import 'package:first_app/model/weather_model.dart';
import 'package:first_app/services/weather/weather_services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart'; // ⬅️ for formatting time

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('631a0ceafbf0d99b5b9312d03efe6779');
  Weather? _weather;

  _fetchWeather() async {
    try {
      final weather = await _weatherService.getWeatherByLocation();
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'lib/images/animation/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'lib/images/animation/cloudy.json';
      case 'rain':
      case 'shower rain':
      case 'drizzle':
        return 'lib/images/animation/rain.json';
      case 'clear':
        return 'lib/images/animation/sunny.json';
      default:
        return 'lib/images/animation/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  // Live Clock Stream
  Stream<String> _clockStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield DateFormat('hh:mm:ss a').format(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          // Main Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // City Name
                  Text(_weather?.cityName ?? "Loading city..."),

                  // Weather Animation
                  Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

                  // Temperature
                  Text(
                    '${_weather?.temparature.round()}°C',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Weather Condition
                  Text(_weather?.mainCondition ?? ""),
                ],
              ),
            ),
          ),

          // Clock in Top-Right Corner
          Positioned(
            top: 40,
            right: 20,
            child: StreamBuilder<String>(
              stream: _clockStream(),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
