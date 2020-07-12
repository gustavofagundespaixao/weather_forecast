import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:previsao_do_tempo/app/modules/weather/weather_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Weather forecast',
      home: WeatherModule(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          centerTitle: false,
          color: Colors.transparent,
          elevation: 0,
        ),
        brightness: Brightness.dark,
      ),
    );
  }
}
