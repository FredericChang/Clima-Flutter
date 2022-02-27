import 'dart:async';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  String errorCode;

  Future<void> getLocation() async {
    try {
      // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = 37;
      longitude = 139;
    } catch (e) {
      print(e);
    }
  }
  //
  // Future<void> getLocation() async{
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // //   final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
  // //   if(!isServiceEnabled) {
  // //     errorCode = 'Fail';
  // //     return errorCode;
  // //   }
  // //
  // //   try{
  // //     // await Geolocator.checkPermission();
  // //     // await Geolocator.requestPermission();
  // //     final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
  // //     bool isGpsOn = serviceStatus.isEnabled;
  // //     print(isGpsOn);
  // //     // final position = await Geolocator.getLastKnownPosition();
  // //     final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // //
  // //     // final position = await _geolocatorPlatform.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // //     print(position);
  // //     latitude = position.latitude;
  // //     longitude = position.longitude;
  // //   } on TimeoutException catch (_) {
  // //     print('======== timeout');
  // //   } on Error catch(e) {
  // //     print(e.toString());
  // //   }
  // //
  // }

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
