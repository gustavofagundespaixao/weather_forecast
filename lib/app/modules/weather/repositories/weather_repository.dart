import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_do_tempo/app/modules/weather/models/weather_model.dart';
import 'package:previsao_do_tempo/app/shared/utils/constants.dart';
import 'package:previsao_do_tempo/app/shared/utils/dio_client.dart';

class WeatherRepository extends Disposable {
  final DioClient client;

  WeatherRepository(this.client);

  Future<WeatherModel> get(String value) async {
    final path = 'weather?q=$value&APPID=$APPID';

    var result = await client.get(path);

    try {
      return WeatherModel.fromJson(result.data);
    } catch (e) {
      throw e;
    }
  }

  @override
  void dispose() {}
}
