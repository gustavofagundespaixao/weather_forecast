import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_do_tempo/app/modules/forecast/widgets/forecast_widget.dart';
import 'package:previsao_do_tempo/app/shared/models/forecast.dart';
import 'package:previsao_do_tempo/app/shared/widgets/loading_shimmer_widget.dart';
import 'forecast_controller.dart';
import 'models/forecast_model.dart';

class ForecastPage extends StatefulWidget {
  final String title;
  const ForecastPage({Key key, this.title = "Forecast"}) : super(key: key);

  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState
    extends ModularState<ForecastPage, ForecastController> {
  @override
  void initState() {
    controller.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ListTile(title: Text('Next 5 days')),
          Expanded(
            child: FutureBuilder<ForecastModel>(
              future: controller.get(),
              builder: (_, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return LoadingShimmerWidget();
                      },
                      separatorBuilder: (_, index) {
                        return SizedBox(height: 8);
                      },
                    );
                  default:
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        final date = DateTime.now().add(
                          Duration(days: index + 1),
                        );

                        final weathers = snapshot.data.list
                            .where(
                              (element) => element.dtTxt.day == date.day,
                            )
                            .toList();

                        return ForecastWidget(forecast: weathers[0]);
                      },
                      separatorBuilder: (_, index) {
                        return SizedBox(height: 8);
                      },
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
