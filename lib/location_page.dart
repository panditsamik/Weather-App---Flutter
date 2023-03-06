import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var cityName = 'Kolkata';

class LocationPage extends StatefulWidget {
  final latitude;
  final longitude;

  LocationPage({@required this.latitude, @required this.longitude});
  String apiKey = '0018f5edeaa6234dc5d79b09d4bfec38';

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey.shade900,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Weather App',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.location_city_outlined,
                    color: Colors.white,
                    size: 35.0,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        border: InputBorder.none,
                        labelText: "Enter City Name",
                      ),
                      controller: controller,
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
              style: ElevatedButton.styleFrom(
                elevation: 18.0,
                textStyle: const TextStyle(color: Colors.white),
                backgroundColor: Colors.blueGrey.shade600,
              ),
              child: const Text(
                'Get Weather',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
