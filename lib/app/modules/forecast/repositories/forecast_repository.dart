import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_do_tempo/app/modules/forecast/models/forecast_model.dart';
import 'package:previsao_do_tempo/app/shared/utils/constants.dart';
import 'package:previsao_do_tempo/app/shared/utils/dio_client.dart';

class ForecastRepository extends Disposable {
  final DioClient client;

  ForecastRepository(this.client);

  Future<ForecastModel> get(int value) async {
    final path = 'forecast?id=$value&APPID=$APPID';

    var result = await client.get(path);

    try {
      return ForecastModel.fromJson(result.data);
    } catch (e) {
      throw e;
    }
  }

  @override
  void dispose() {}
}
