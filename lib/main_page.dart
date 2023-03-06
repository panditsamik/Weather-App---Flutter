import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/location_page.dart';
import 'package:weather_app/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/weather.dart';

var temp;
var condition = 200;
var cityName = 'Kolkata';
String weatherMessage = 'Bring a 🧥 just in case';
String finaltemp = '15';
String weatherIcon = '';
var typedName;

class MainPage extends StatefulWidget {
  final latitude;
  final longitude;

  MainPage({@required this.latitude, @required this.longitude});
  String apiKey = '0018f5edeaa6234dc5d79b09d4bfec38';

  void refreshWeatherData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey'),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      temp = decodedData["main"]["temp"];
      finaltemp = temp.toStringAsFixed(2);
      condition = decodedData["weather"][0]["id"];
      cityName = decodedData["name"];
      Weather weather = Weather();
      weatherIcon = weather.getWeatherIcon(condition);
      int temperature = temp.toInt();
      print(temperature);
      weatherMessage = weather.getMessage(temperature);
    } else {
      temp = 0;
      weatherIcon = 'Error';
      weatherMessage = "Unable to get weather data";
      cityName = "";
      return;
    }
  }

  void refreshWeatherDataUsingLocation() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey'),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      temp = decodedData["main"]["temp"];
      finaltemp = temp.toStringAsFixed(2);
      condition = decodedData["weather"][0]["id"];
      cityName = decodedData["name"];
      Weather weather = Weather();
      weatherIcon = weather.getWeatherIcon(condition);
      int temperature = temp.toInt();
      print(temperature);
      weatherMessage = weather.getMessage(temperature);
    } else {
      temp = 0;
      weatherIcon = 'Error';
      weatherMessage = "Unable to get weather data";
      cityName = "";
      return;
    }
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.refreshWeatherData();
      widget.refreshWeatherDataUsingLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("images/MainPage.jpeg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Expanded(
                      child: Icon(
                        Icons.near_me,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        widget.refreshWeatherData();
                      });
                    },
                  ),
                  const SizedBox(
                    width: 240.0,
                  ),
                  GestureDetector(
                    child: const Expanded(
                      child: Icon(
                        Icons.location_city_outlined,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                    onTap: () async {
                      typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationPage(),
                        ),
                      );
                      if (typedName != null) {
                        setState(() {
                          cityName = typedName;
                          widget.refreshWeatherDataUsingLocation();
                        });
                        Future.delayed(const Duration(milliseconds: 1000), () {
// Here you can write your code

                          setState(() {
                            widget.refreshWeatherDataUsingLocation();
                          });
                        });
                      }
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '$finaltemp°',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    weatherIcon,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherMessage,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 70.0,
                    fontFamily: 'Spartan MB',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
