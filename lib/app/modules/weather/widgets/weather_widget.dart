import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:previsao_do_tempo/app/modules/forecast/forecast_module.dart';
import 'package:previsao_do_tempo/app/modules/weather/models/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherModel model;

  const WeatherWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          title: Text('${model.name}, ${model.sys.country}'),
          subtitle: model == null
              ? LinearProgressIndicator()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(model.weather[0].main),
                    SizedBox(width: 4),
                    Image.asset(
                      'assets/images/${model.weather[0].icon}.png',
                      width: 20,
                    ),
                  ],
                ),
          trailing: model == null
              ? null
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${model.main.temp.toStringAsFixed(0)}°C',
                      style: Get.textTheme.headline6,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${model.main.tempMax.toStringAsFixed(0)}°',
                          style: Get.textTheme.caption,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '${model.main.tempMin.toStringAsFixed(0)}°',
                          style: Get.textTheme.caption.copyWith(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
        onTap: () {
          Get.to(ForecastModule(model.id));
        },
      ),
    );
  }
}
