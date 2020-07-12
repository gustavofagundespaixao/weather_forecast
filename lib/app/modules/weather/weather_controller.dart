import 'package:mobx/mobx.dart';
import 'package:previsao_do_tempo/app/modules/weather/repositories/weather_repository.dart';
import 'package:previsao_do_tempo/app/modules/weather/models/weather_model.dart';

part 'weather_controller.g.dart';

class WeatherController = _WeatherControllerBase with _$WeatherController;

abstract class _WeatherControllerBase with Store {
  final WeatherRepository repository;

  _WeatherControllerBase(this.repository);

  List<String> get places => [
        'Silverstone, UK',
        'São Paulo, Brazil',
        'Melbourne, Australia',
        'Monte Carlo, Monaco',
      ];

  Future<WeatherModel> get(String value) async {
    return await repository.get(value);
  }
}
