import 'package:flutter/material.dart';
import 'package:previsao_do_tempo/app/shared/utils/dio_client.dart';
import 'weather_controller.dart';
import 'repositories/weather_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'weather_page.dart';

class WeatherModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WeatherController(i.get())),
        Bind((i) => WeatherRepository(DioClient())),
      ];

  static Inject get to => Inject<WeatherModule>.of();

  @override
  Widget get view => WeatherPage();
}
