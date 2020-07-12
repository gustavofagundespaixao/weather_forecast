import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:previsao_do_tempo/app/shared/models/forecast.dart';

class ForecastWidget extends StatelessWidget {
  final Forecast forecast;

  const ForecastWidget({Key key, this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('E, dd MMM').format(
      forecast.dtTxt,
    );

    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(dateFormat),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(forecast.weather[0].main),
            SizedBox(width: 4),
            Image.asset(
              'assets/images/${forecast.weather[0].icon}.png',
              width: 20,
            ),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${forecast.main.temp.toStringAsFixed(0)}°C',
              style: Get.textTheme.headline6,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${forecast.main.tempMax.toStringAsFixed(0)}°',
                  style: Get.textTheme.caption,
                ),
                SizedBox(width: 4),
                Text(
                  '${forecast.main.tempMin.toStringAsFixed(0)}°',
                  style: Get.textTheme.caption.copyWith(
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
