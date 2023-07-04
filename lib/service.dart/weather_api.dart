import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/search.dart';
import '../model/weather_model.dart';

class WeatherApiService {
  final Dio _dio = Dio();
  static String baseUrl = 'http://api.weatherapi.com/v1';
  static String apiKey = '78d027c4a6e44209bc4122821230407';

  Future<WeatherModel> getWeatherData(String location) async {
    final response = await _dio.get(
      '$baseUrl/forecast.json?key=$apiKey&q=31.52,34.47&days=5&aqi=no&alerts=no',
    );

    if (response.statusCode == 200) {
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      debugPrint(response.data.toString());
      return weatherModel;
    } else {
      throw Exception('Failed to fetch weather data1');
    }
  }

  Future<Search> searchLocation(String search) async {
    final response = await _dio.get(
      '$baseUrl/search.json?key=$apiKey&q=$search',
    );

    if (response.statusCode == 200) {
      Search search = Search.fromJson(response.data);
      debugPrint(response.data.toString());
      return search;
    } else {
      throw Exception('Failed to fetch weather data1');
    }
  }
}
