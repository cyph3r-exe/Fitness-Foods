import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  final _weatherservice = WeatherService('37ccd0a3dcf43382d325a1d9dea063bb');
  Weather? _weather;
  
  _fetchWeather() async {

    String cityName = await _weatherservice.getcurrentCity();

    try {
      final weather = await _weatherservice.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }

  }
  void initState() {
    super.initState();

    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}