// ignore_for_file: file_names

import '../request.dart';

class WeatherApis {
  static getWeather() {
    // http://www.weather.com.cn/data/sk/101010100.html // 北京的天气数据
    return Request.get('http://www.weather.com.cn/data/sk/101010100.html');
  }

  static getWeatherByCode(code) {
    return Request.get('http://www.weather.com.cn/data/sk/$code.html');
  }
}