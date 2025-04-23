import 'package:flutter/material.dart';

class TemperatureProvider with ChangeNotifier {
  double celcius = 0.0;
  double reamur = 0.0;
  double fahrenheit = 0.0;
  double kelvin = 0.0;

  void fromCelcius(double c) {
    celcius = c;
    reamur = c * 4 / 5;
    fahrenheit = (c * 9 / 5) + 32;
    kelvin = c + 273.15;
    notifyListeners();
  }

  void fromReamur(double r) {
    celcius = r * 5 / 4;
    reamur = r;
    fahrenheit = (r * 9 / 4) + 32;
    kelvin = (r * 5 / 4) + 273.15;
    notifyListeners();
  }

  void fromFahrenheit(double f) {
    celcius = (f - 32) * 5 / 9;
    reamur = (f - 32) * 4 / 9;
    fahrenheit = f;
    kelvin = celcius + 273.15;
    notifyListeners();
  }

  void fromKelvin(double k) {
    celcius = k - 273.15;
    reamur = (celcius * 4 / 5);
    fahrenheit = (celcius * 9 / 5) + 32;
    kelvin = k;
    notifyListeners();
  }
}
