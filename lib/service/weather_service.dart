import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/hourly_weather_model.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/api_data.dart';

class WeatherServices {
  getCurrentWeather(double latitude, double longitude) async {
    final baseUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    try {
      final response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var data = weatherModelFromJson(response.body.toString());
        log(data.toString());
        log('entered');
        return data;
      } else {
        log('else');
      }
    } catch (e) {
      log('$e ---catch error');
    }
    return null;
  }

  getHourlyWeather(double latitude, double longitude) async {
    final baseUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    try {
      final response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var data = hourlyWeatherDataFromJson(response.body.toString());
        log(data.toString());
        log('entered');
        return data;
      } else {
        log('else');
      }
    } catch (e) {
      log('$e ---catch error');
    }
    return null;
  }
}
