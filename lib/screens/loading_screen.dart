import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';

const apiKey = 'bf1fd9b91d8d9ec921a23c223266d14b';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();
    latitude =  location.latitude;
    longitude = location.longitude;

    var weatherUrl = Uri(
        scheme: 'http',
        host:'api.openweathermap.org',
        path:'/data/2.5/weather',
        queryParameters: {'lat' : latitude.toString(), 'lon' : longitude.toString(), 'appid' : apiKey}
    );
    NetworkHelper newworkHelper = NetworkHelper(weatherUrl);
    var weatherData = await newworkHelper.getData();
    //
    // String cityName =decodedData['name'];
    // int condition = decodedData['weather'][0]['id'];
    // double temperature = decodedData['main']['temp'];
    // print("cityName = ${cityName}");
    // print("condition = ${condition}");
    // print("temperature = ${temperature}");


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getLocation();

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
      print('longitude= ${longitude} and latitude= ${latitude}');
      var weatherDes = jsonDecode(data)['weather'][0]['description'];
      print('description= ${weatherDes}');



    }else {
      print(response.statusCode);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            // getLocation();
            getData(33, 139, apiKey);
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
