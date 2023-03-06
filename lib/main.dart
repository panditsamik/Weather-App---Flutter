import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/main_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey.shade700,
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
        body: HomePage(),
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var longitude;
  var latitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      latitude = position.latitude;
      longitude = position.longitude;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(
            latitude: latitude,
            longitude: longitude,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SpinKitWave(
      color: Colors.white,
      size: 50.0,
    );
  }
}
