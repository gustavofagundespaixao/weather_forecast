import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:previsao_do_tempo/app/app_widget.dart';
import 'package:previsao_do_tempo/app/modules/weather/weather_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: WeatherModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
