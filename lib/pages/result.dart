import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

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
