import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:client/models/weather.dart';
import 'package:client/constant.dart';

class WeatherScreen extends StatefulWidget{
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? _error;
  late Weather weather;
  bool _isLoading=true;

  void _loadItems() async{
    final url=Uri.http(Constant.url,'WeatherForecast',);
    try{
      final response=await http.get(url);
      final Map<String, dynamic> data=json.decode(response.body);
      weather=Weather(date: data['date'], temperatureC: data['temperatureC'], temperatureF: data['temperatureF'], summary: data['summary']);
      setState(() {
        _isLoading=false;
      });
    }
    catch(error){
        setState(() {
        _error='Something went wrong!';
        _isLoading=false;
        });
    }
  }
  
  @override
  void initState() {
    super.initState();
    _loadItems();
  }
  
  @override
  Widget build(BuildContext context) {
    const Color color1=Color.fromARGB(100, 92, 37, 141);
    const Color color2=Color.fromARGB(100, 67, 137, 162);
    Widget content= const CircularProgressIndicator();
    if(!_isLoading&&_error==null){
      content= Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(weather.icon, size: 200, color: const Color.fromARGB(97, 33, 105, 134)),
              const SizedBox(height: 30,),
              Text('${weather.temperatureC}° C', style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Text(weather.summary.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              Text('Today: ${weather.date}', style: const TextStyle(color: Color.fromARGB(95, 56, 6, 101), fontSize: 30, fontWeight: FontWeight.bold),),
            ],
          );
    }

    if(_error!=null){
      content=Text(_error!, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold));
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
        colors: [color1, color2],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight 
      )
      ),
        child: Center(
          child: content,
        ),
      ),
    );
  }
}    