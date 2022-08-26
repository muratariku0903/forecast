import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tmp/classes/geolocation.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

class ResultPage extends StatefulWidget {
  final double lat;
  final double lon;
  const ResultPage({Key? key, required this.lat, required this.lon})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final WeatherFactory wf = WeatherFactory('1fd9bd35b75f1f31e2fb075342367115',
      language: Language.JAPANESE);
  final Geolocation geolocation = Geolocation();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<> getLocation() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WEATHER FORECAST RESULT'),
      ),
      body: Center(
        child: Column(
          children: const [
            Text('sample.'),
            Text('sample.'),
            Text('sample.'),
            Text('sample.'),
            Text('sample.'),
          ],
        ),
      ),
    );
  }
}
