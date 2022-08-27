import 'package:flutter/material.dart';
import 'package:tmp/classes/weather.dart';
import 'package:tmp/constants/weatherApiKey.dart';

class ResultPage extends StatefulWidget {
  final String cityName;
  const ResultPage({Key? key, required this.cityName}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final weather = Weather(weatherApiKey: weatherApiKey);
  double? temp;
  String? condition;
  bool isErr = false;

  @override
  void initState() {
    super.initState();
    setWeather();
  }

  void setWeather() async {
    WeatherInfo? weatherInfo =
        await weather.getWeatherFromCityName(widget.cityName);

    if (weatherInfo == null) {
      print('hello');
      setState(() {
        isErr = true;
      });
      return;
    }

    setState(() {
      temp = weatherInfo.temp;
      condition = weatherInfo.condition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WEATHER FORECAST RESULT')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              if (isErr) const Text('Fail get data.'),
              if (!isErr)
                Column(
                  children: [
                    const Text('Temp'),
                    if (temp != null) Text(temp.toString()),
                    const Text('Condition'),
                    if (condition != null) Text(condition!),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
