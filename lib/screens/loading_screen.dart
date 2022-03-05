import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    // AppSettings.openLocationSettings;
    print('init');
    getLocationData();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  Future<void> getLocationData() async {
    print('init');
    var weatherData = await WeatherModel().getLocationWeather();
    // String cityName =weatherData['name'];
    // int condition = weatherData['weather'][0]['id'];
    // double temperature = weatherData['main']['temp'];
    // print("cityName = ${cityName}");
    // print("condition = ${condition}");
    // print("temperature = ${temperature}");
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));

  }

  void getData(double latitude, double longitude, String apiKey) async {

    var weatherUrl = Uri(
      scheme: 'http',
      host:'api.openweathermap.org',
      path:'/data/2.5/weather',
      queryParameters: {'lat' : latitude.toString(), 'lon' : longitude.toString(), 'appid' : apiKey}
    );
    http.Response response = await http.get(weatherUrl);
    print(response.body);
    print(response.statusCode);
    print(weatherUrl);

    if (response.statusCode == 200){
      String data = response.body;
      var longitude = jsonDecode(data)['coord']['lon'];
      var latitude = jsonDecode(data)['coord']['lat'];
      print('longitude= $longitude and latitude= $latitude');
      var weatherDes = jsonDecode(data)['weather'][0]['description'];
      print('description= $weatherDes');
    }else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,

        ),
      )
    );
  }

}
