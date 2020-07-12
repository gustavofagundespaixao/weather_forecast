class Main {
  double temp;
  double tempMin;
  double tempMax;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] - 273.15;
    tempMin = json['temp_min'] - 273.15;
    tempMax = json['temp_max'] - 273.15;
  }
}
