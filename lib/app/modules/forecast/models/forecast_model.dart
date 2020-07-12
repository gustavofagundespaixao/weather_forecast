import 'package:previsao_do_tempo/app/shared/models/forecast.dart';

class ForecastModel {
  int cnt;
  List<Forecast> list;

  ForecastModel({this.cnt, this.list});

  ForecastModel.fromJson(Map<String, dynamic> json) {
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = new List<Forecast>();
      json['list'].forEach((v) {
        list.add(new Forecast.fromJson(v));
      });
    }
  }
}

// class WeatherDay {
//   dynamic dt;
//   Main main;
//   List<Weather> weather;
//   Sys sys;
//   String dtTxt;

//   WeatherDay({this.dt, this.main, this.weather, this.sys, this.dtTxt});

//   WeatherDay.fromJson(Map<String, dynamic> json) {
//     dt = json['dt'];
//     main = json['main'] != null ? new Main.fromJson(json['main']) : null;
//     if (json['weather'] != null) {
//       weather = new List<Weather>();
//       json['weather'].forEach((v) {
//         weather.add(new Weather.fromJson(v));
//       });
//     }
//     sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
//     dtTxt = json['dt_txt'];
//   }
// }
