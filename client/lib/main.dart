import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:client/screens/weather.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp
  ]).then((fn){
    runApp(const App());
  });
}

class App extends StatelessWidget{
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
}