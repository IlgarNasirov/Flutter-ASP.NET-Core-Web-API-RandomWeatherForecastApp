import 'package:flutter/material.dart';

import 'package:client/data/weathericons.dart';

enum WeatherIcon{
  freezing, 
  bracing, 
  chilly, 
  cool, 
  mild, 
  warm, 
  balmy, 
  hot, 
  sweltering, 
  scorching
}

class Weather{
  Weather({required this.date, required this.temperatureC, required this.temperatureF, required this.summary}):icon=weathericons.entries.firstWhere((element) => element.key.name==summary).value;

  final String date;
  final int temperatureC;
  final int temperatureF;
  final String summary;
  final IconData icon;
}