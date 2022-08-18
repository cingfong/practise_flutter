import 'package:clima_flutter/services//location.dart';
import 'package:clima_flutter/services/networking.dart';

const apiKey = 'b6907d289e10d714a6e88b30761fae22';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    double latitude = 35.02;
    // longitude = location.longitude;
    double longitude = 139.01;
    NetworkHelper networkHelper = NetworkHelper(
      'samples.openweathermap.org',
      '/data/2.5/weather',
      latitude.toString(),
      longitude.toString(),
      apiKey,
    );
    // NetworkHelper('samples.openweathermap.org?q=$cityName&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    // 獲取本地gps位置
    // latitude = location.latitude;

    double latitude = 35.02;
    // longitude = location.longitude;
    double longitude = 139.01;
    NetworkHelper networkHelper = NetworkHelper(
      'samples.openweathermap.org',
      '/data/2.5/weather',
      latitude.toString(),
      longitude.toString(),
      apiKey,
    );
    var weatherData = await networkHelper.getData() ?? '';
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
