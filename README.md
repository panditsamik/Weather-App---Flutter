# Weather App - Flutter
It is a weather forecast app built in Dart using geolocator, flutter_spinkit and http.dart flutter packages.

## Link to the API:
<https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={APIkey}>

##### Examples of API calls
<https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={APIkey}>

#### For more information :
<https://openweathermap.org/api>

## Documentation and References :

## Flutter Geolocator Plugin
A Flutter geolocation plugin provides easy access to platform specific location services.

### Features
- Get the last known location
- Get the current location of the device
- Get continuous location updates
- Check if location services are enabled on the device
- Calculate the distance (in meters) between two geocoordinates
- Calculate the bearing between two geocoordinates

#### Current location
To query the current location of the device simply make a call to the getCurrentPosition method. You can finetune the results by specifying the following parameters:

- desiredAccuracy: the accuracy of the location data that your app wants to receive

#### Use this package as a library
Depend on it
Run this command:

With Flutter:
```
flutter pub add geolocator
```

```
dependencies:
  geolocator: ^9.0.2
```

#### Import it
Now in your Dart code, you can use:

```
import 'package:geolocator/geolocator.dart';
```
[Link](https://pub.dev/packages/geolocator)

## ✨ Flutter Spinkit:
A collection of loading indicators animated with flutter. Heavily inspired by @tobiasahlin's SpinKit.

#### Installing
```
dependencies:
  flutter_spinkit: ^5.1.0
```

#### Import
```
import 'package:flutter_spinkit/flutter_spinkit.dart';
```

#### 🎮 How To Use
```
const spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);
```


```
final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
```


```
final spinkit = SpinKitSquareCircle(
  color: Colors.white,
  size: 50.0,
  controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
);
```

[Link](https://pub.dev/packages/flutter_spinkit)


## http 0.13.5
A composable, Future-based library for making HTTP requests.

This package contains a set of high-level functions and classes that make it easy to consume HTTP resources. It's multi-platform, and supports mobile, desktop, and the browser.

#### Use this package as a library
Depend on it
Run this command:

With Flutter:

```
dart pub add http
```

```
dependencies:
  http: ^0.13.5
```

#### Import it
Now in your Dart code, you can use:
```
import 'package:http/http.dart';
```

## Fetch data from the internet
Fetching data from the internet is necessary for most apps. Luckily, Dart and Flutter provide tools, such as the http package, for this type of work.

This recipe uses the following steps:

- Add the http package.
- Make a network request using the http package.
- Convert the response into a custom Dart object.
- Fetch and display the data with Flutter.

### 1. Add the http package
The http package provides the simplest way to fetch data from the internet.

To install the http package, add it to the dependencies section of the pubspec.yaml file. You can find the latest version of the http package the pub.dev.
```
dependencies:
  http: <latest_version>

```

Import the http package
```
import 'package:http/http.dart' as http;
```
Additionally, in your AndroidManifest.xml file, add the Internet permission.
```
<!-- Required to fetch data from the internet. -->
<uses-permission android:name="android.permission.INTERNET" />

```


### 2. Make a network request
```
Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}
```

### Complete example

```
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
```


### For more information :
[Link](https://docs.flutter.dev/cookbook/networking/fetch-data)

## Screenshots :

![WhatsApp Image 2023-03-06 at 11 47 54 PM](https://user-images.githubusercontent.com/91545371/223196652-b7a633ef-0256-4961-8d85-33e26081b515.jpeg)


![WhatsApp Image 2023-03-06 at 11 47 54 PM (1)](https://user-images.githubusercontent.com/91545371/223196896-c84c37d9-210c-4929-8ca3-34a4541ccb3c.jpeg)

![WhatsApp Image 2023-03-06 at 11 47 54 PM (2)](https://user-images.githubusercontent.com/91545371/223196943-e12463b1-e7b5-4cc6-b497-06f85b74beff.jpeg)


# Video

https://user-images.githubusercontent.com/91545371/223197096-3a9c246b-6385-4df3-9b65-b0068ca76a8b.mp4

