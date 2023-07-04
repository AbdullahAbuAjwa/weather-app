import 'package:flutter/material.dart';
import 'package:weather_app/model/search.dart';

import '../model/weather_model.dart';
import '../service.dart/weather_api.dart';

class WeatherController with ChangeNotifier {
  WeatherModel? weatherModel;
  bool isLoading = false;
  Search? search;

  final WeatherApiService _apiService = WeatherApiService();

  Future<void> fetchData() async {
    try {
      weatherModel = await _apiService.getWeatherData('31.52,34.47');
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to fetch weather data');
    }
  }

  Future<void> searchData(TextEditingController textController) async {
    setLoader(true);
    search = await _apiService.searchLocation(textController.text);

    try {
      setLoader(false);
    } catch (e) {
      setLoader(false);
      debugPrint('Failed to fetch weather data');
    }
  }

  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
