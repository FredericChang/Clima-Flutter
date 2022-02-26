
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future<void> getLocation() async{
    try{
      final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
      final position = await _geolocatorPlatform.getCurrentPosition();
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e) {
      print(e);
    }

  }

}

// class location extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     String myMargin = '15';
//     double myMarginAsADouble;
//
//     try {
//       myMarginAsADouble = double.parse(myMargin);
//     }
//     catch (e){
//       print(e);
//       myMarginAsADouble = 30;
//     }
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.all(myMarginAsADouble),
//         color: Colors.red,
//       ),
//     );
//   }
// }
