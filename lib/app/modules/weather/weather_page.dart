import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_do_tempo/app/modules/weather/models/weather_model.dart';
import 'package:previsao_do_tempo/app/shared/widgets/day_widget.dart';
import 'package:previsao_do_tempo/app/shared/widgets/loading_shimmer_widget.dart';
import 'weather_controller.dart';
import 'widgets/weather_widget.dart';

class WeatherPage extends StatefulWidget {
  final String title;
  const WeatherPage({Key key, this.title = "Weather"}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends ModularState<WeatherPage, WeatherController> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DayWidget(),
              SizedBox(height: 16),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Search',
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      search = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
              search.isEmpty
                  ? Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.places.length,
                        itemBuilder: (_, index) {
                          final place = controller.places[index];

                          return FutureBuilder<WeatherModel>(
                            future: controller.get(place),
                            builder: (_, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return LoadingShimmerWidget();
                                default:
                                  if (snapshot.hasError) return Text('Error');

                                  return WeatherWidget(model: snapshot.data);
                              }
                            },
                          );
                        },
                        separatorBuilder: (_, index) {
                          return SizedBox(height: 8);
                        },
                      ),
                    )
                  : FutureBuilder<WeatherModel>(
                      future: controller.get(search),
                      builder: (_, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return LoadingShimmerWidget();
                          default:
                            if (snapshot.hasError) return Text('Error');

                            return WeatherWidget(model: snapshot.data);
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
