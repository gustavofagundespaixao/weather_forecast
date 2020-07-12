import 'package:previsao_do_tempo/app/shared/models/main.dart';
import 'package:previsao_do_tempo/app/shared/models/sys.dart';
import 'package:previsao_do_tempo/app/shared/models/weather.dart';

class WeatherModel {
  List<Weather> weather;
  Main main;
  Sys sys;
  int timezone;
  int id;
  String name;

  WeatherModel({
    this.weather,
    this.main,
    this.sys,
    this.timezone,
    this.id,
    this.name,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
  }
}

// class Weather {
//   int id;
//   String main;
//   String description;
//   String icon;

//   Weather({this.id, this.main, this.description, this.icon});

//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     main = json['main'];
//     description = json['description'];
//     icon = json['icon'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['main'] = this.main;
//     data['description'] = this.description;
//     data['icon'] = this.icon;
//     return data;
//   }
// }

// class Main {
//   double temp;
//   double tempMin;
//   double tempMax;

//   Main({
//     this.temp,
//     this.tempMin,
//     this.tempMax,
//   });

//   Main.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'] - 273.15;
//     tempMin = json['temp_min'] - 273.15;
//     tempMax = json['temp_max'] - 273.15;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['temp'] = this.temp;
//     data['temp_min'] = this.tempMin;
//     data['temp_max'] = this.tempMax;
//     return data;
//   }
// }

// class Sys {
//   int type;
//   int id;
//   String country;
//   int sunrise;
//   int sunset;

//   Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

//   Sys.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     id = json['id'];
//     country = json['country'];
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['id'] = this.id;
//     data['country'] = this.country;
//     data['sunrise'] = this.sunrise;
//     data['sunset'] = this.sunset;
//     return data;
//   }
// }
