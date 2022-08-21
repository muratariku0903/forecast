import 'package:flutter/material.dart';
import 'package:tmp/pages/result.dart';
import 'package:tmp/classes/geolocation.dart';
import 'package:geolocator/geolocator.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  final geolocation = Geolocation();
  String location = '';

  void setLocation() async {
    final Position position = await geolocation.determinePosition();
    print(position);
    setState(() {
      location = position.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'WEATHER FORECAST',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/images/girl.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(255, 193, 7, 0.7),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Enter city name.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'city name.',
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        Text(
                          location,
                        ),
                        TextButton(
                          onPressed: setLocation,
                          child: const Text('Get location info.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          color: Colors.black,
          child: TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ResultPage(),
              ),
            ),
            child: const Text(
              'FORECAST!',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
