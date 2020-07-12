import 'package:flutter/material.dart';
import 'package:previsao_do_tempo/app/shared/utils/dio_client.dart';
import 'forecast_controller.dart';
import 'repositories/forecast_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'forecast_page.dart';

class ForecastModule extends WidgetModule {
  final int id;

  ForecastModule(this.id);

  @override
  List<Bind> get binds => [
        Bind((i) => ForecastController(id, i.get())),
        Bind((i) => ForecastRepository(DioClient())),
      ];

  static Inject get to => Inject<ForecastModule>.of();

  @override
  Widget get view => ForecastPage();
}
