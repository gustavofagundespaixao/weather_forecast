import 'package:previsao_do_tempo/app/shared/models/main.dart';
import 'package:previsao_do_tempo/app/shared/models/sys.dart';
import 'package:previsao_do_tempo/app/shared/models/weather.dart';

class Forecast {
  dynamic dt;
  Main main;
  List<Weather> weather;
  Sys sys;
  DateTime dtTxt;

  Forecast({this.dt, this.main, this.weather, this.sys, this.dtTxt});

  Forecast.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    dtTxt = DateTime.parse(json['dt_txt']);
  }
}
