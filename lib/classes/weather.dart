import 'package:dio/dio.dart';

class WeatherInfo {
  double temp;
  String condition;
  WeatherInfo({required this.temp, required this.condition});
}

class Weather {
  String weatherApiKey;
  String url = 'https://api.openweathermap.org/data/2.5/weather';
  Dio dio = Dio();

  Weather({required this.weatherApiKey});

  Future<WeatherInfo?> getWeatherFromLocation(double lat, double lon) async {
    WeatherInfo? weatherInfo;

    try {
      String path = '$url?lat=$lat&lon=$lon&appid=$weatherApiKey';
      final res = await dio.get(path);
      weatherInfo = createWeatherInfoFromHttpRes(res);
    } catch (e) {
      weatherInfo = null;
      print(e);
    }

    return weatherInfo;
  }

  Future<WeatherInfo?> getWeatherFromCityName(String cityName) async {
    WeatherInfo? weatherInfo;

    try {
      String path = '$url?q=$cityName&appid=$weatherApiKey';
      final res = await dio.get(path);
      weatherInfo = createWeatherInfoFromHttpRes(res);
    } catch (e) {
      print(e);
    }

    return weatherInfo;
  }

  WeatherInfo createWeatherInfoFromHttpRes(dynamic res) {
    double temp = res.data['main']['temp'];
    String condition = res.data['weather'][0]['main'];
    
    return WeatherInfo(temp: temp, condition: condition);
  }
}
