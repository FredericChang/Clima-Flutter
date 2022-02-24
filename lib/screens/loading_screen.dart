import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async{

    final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
    final position = await _geolocatorPlatform.getCurrentPosition();
    // final Position position = await _geolocatorPlatform.getLastKnownPosition();
    // await Geolocator.checkPermission();
    // await Geolocator.requestPermission();
    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
    // print("position");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
