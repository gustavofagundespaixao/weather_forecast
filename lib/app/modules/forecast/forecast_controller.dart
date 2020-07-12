import 'package:mobx/mobx.dart';
import 'package:previsao_do_tempo/app/modules/forecast/repositories/forecast_repository.dart';
import 'package:previsao_do_tempo/app/modules/forecast/models/forecast_model.dart';

part 'forecast_controller.g.dart';

class ForecastController = _ForecastControllerBase with _$ForecastController;

abstract class _ForecastControllerBase with Store {
  final int id;
  final ForecastRepository repository;

  _ForecastControllerBase(this.id, this.repository);

  @observable
  ObservableFuture<ForecastModel> items;

  @action
  Future<ForecastModel> get() async {
    return await repository.get(id);
  }
}
